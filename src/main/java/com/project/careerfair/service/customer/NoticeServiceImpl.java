package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.mapper.notice.NoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    @Override
    public Map<String, Object> getNoticeList(String search, String type, Integer page) {
        Integer pageSize = 5; // 10개씩 -> 5개씩
        Integer startNum = (page - 1) * pageSize; // 0 10 20

        //페이지네이션 정보
        //총 글 개수
        Integer count = noticeMapper.countAll(type, search);

        // 마지막 페이지 번호
        // 총 글개수 -1 / pageSize + 1
        Integer lastPage = (count - 1) / pageSize + 1;

        // 페이지네이션 왼쪽번호 1 11 21 31
        Integer leftPageNum = (page - 1) / pageSize * pageSize + 1;
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이지네이션 오른쪽 번호
        Integer rightPageNum = leftPageNum + 9;
        rightPageNum = Math.min(rightPageNum, lastPage);

        // 이전페이지
        Integer prevPageNum = leftPageNum - 10;
        prevPageNum = Math.max(leftPageNum - 10, 1);

        // 다음 페이지
        Integer nextPageNum = leftPageNum + 10;

        Integer number = count - (page - 1) * pageSize;

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("lastPageNum", lastPage);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("prevPageNum", prevPageNum);
        pageInfo.put("nextPageNum", nextPageNum);
        pageInfo.put("number", number);

        List<Notice> noticeList = noticeMapper.getNoticeList(startNum, pageSize, search, type);

        List<Notice> topNoticeList = noticeMapper.getTopNoticeList();

        return Map.of("pageInfo", pageInfo, "noticeList", noticeList, "topNoticeList", topNoticeList);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> getDetail(Integer noticeId) {

        // 조회수 증가
        noticeMapper.hitUp(noticeId);
        
        // 글상세
        Notice notice = noticeMapper.getDetail(noticeId);

        LocalDateTime modified = notice.getModified();

        //이전글
        Integer prevNotice = noticeMapper.getPrevNotice(noticeId, modified);

        if (prevNotice == null) {
            prevNotice = noticeMapper.getFirstNotice(noticeId);
        }

        //다음글
        Integer nextNotice = noticeMapper.getNextNotice(noticeId, modified);

        if (nextNotice == null) {
            nextNotice = noticeMapper.getLastNotice(noticeId);
        }

        return Map.of("notice", notice,
                "prevNotice", prevNotice,
                "nextNotice", nextNotice
        );
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean create(Notice notice, MultipartFile[] files, Authentication authentication) throws IOException {

        if (authentication == null) {
            notice.setMemberId("admin0");
        }
        notice.setMemberId(authentication.getName());
        // 공지사항 등록
        int cnt = noticeMapper.insert(notice);

        fileToS3(notice, files);

        return cnt == 1;
    }

    //  공지사항 수정
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean modify(Notice notice, MultipartFile[] files, List<String> removeFileNames, Authentication authentication) throws IOException {
        notice.setModifierId(authentication.getName());
        Integer noticeId = notice.getNoticeId();
        if (removeFileNames != null && !removeFileNames.isEmpty()) {
            for (String fileName : removeFileNames) {
                removeFromS3(noticeId, fileName);

                // FileName 테이블의 데이터 삭제
                noticeMapper.deleteFileNameByNoticeIdAndFileName(noticeId, fileName);
            }
        }

        // 공지사항 정보 수정
        int cnt = noticeMapper.update(notice);

        if (files != null) {
            fileToS3(notice, files);
        }
        return cnt == 1;
    }

    // 공지사항삭제
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean delete(Integer noticeId) {
        //파일 이름들 불러오기
        List<String> fileNames = noticeMapper.selectFileNamesByNoticeId(noticeId);

        if (fileNames != null && !fileNames.isEmpty()) {
            for (String fileName : fileNames) {
                removeFromS3(noticeId, fileName);
            }
        }

        // 테이블에서 파일 삭제
        noticeMapper.deleteFileNameByNoticeId(noticeId);

        //공지사항 삭제
        int cnt = noticeMapper.deleteById(noticeId);
        return cnt == 1;
    }

    // 파일 등록 메소드
    public void fileToS3(Notice notice, MultipartFile[] files) throws IOException {
        // 파일등록
        for (MultipartFile file : files) {
            if (file.getSize() > 0) {
                String objectKey = "career_fair/notice/" + notice.getNoticeId() + "/" + file.getOriginalFilename();

                // s3에 파일 업로드
                PutObjectRequest por = PutObjectRequest.builder()
                        .bucket(bucketName)
                        .acl(ObjectCannedACL.PUBLIC_READ)
                        .key(objectKey)
                        .build();
                RequestBody rb = RequestBody.fromInputStream(file.getInputStream(),
                        file.getSize());

                s3.putObject(por, rb);

                // db에 관련정보저장 (insert)
                noticeMapper.insertFileName(notice.getNoticeId(), file.getOriginalFilename());
            }
        }
    }

    // 파일 삭제 메소드
    public void removeFromS3(Integer noticeId, String fileName) {
        // 파일 삭제
        String objectKey = "career_fair/notice/" + noticeId + "/" + fileName;

        DeleteObjectRequest dor = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(objectKey)
                .build();
        s3.deleteObject(dor);
    }
}