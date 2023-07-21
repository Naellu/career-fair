package com.project.careerfair.service.admin;

import com.project.careerfair.domain.exhibitionInfo.ExhibitionInfo;
import com.project.careerfair.mapper.exhibitionInfo.ExhibitionInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ExhibitionInfoServiceImpl implements ExhibitionInfoService {

    private final ExhibitionInfoMapper exhibitionInfoMapper;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    // 현재회차 번호 얻기
    @Override
    public Integer getCurrentRound() {
        return exhibitionInfoMapper.getCurrentRound();
    }

    // 현재회차 정보 얻기
    @Override
    public ExhibitionInfo getCurrentInfo() {
        Integer round = exhibitionInfoMapper.getCurrentRound();

        ExhibitionInfo exhibitionInfo = exhibitionInfoMapper.getCurrentInfo(round);

        return exhibitionInfo;
    }

    // 회차 등록하기
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean reg(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException {
        Integer cnt = exhibitionInfoMapper.insert(exhibitionInfo);

        if (files != null) {
            fileToS3(exhibitionInfo, files);
        }

        // 채용담당자 권한을 company로 전부 변경하기

        return cnt == 1;
    }

    // 회차 수정
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean update(ExhibitionInfo exhibitionInfo,
                          List<String> removeFileNames,
                          MultipartFile[] files) throws IOException {
        Integer round = exhibitionInfo.getRound();
        // 파일 삭제
        if (removeFileNames != null && !removeFileNames.isEmpty()) {
            for (String fileName : removeFileNames) {
                removeFromS3(round, fileName);

                // FileName 테이블의 데이터 삭제
                exhibitionInfoMapper.deleteFileNameByRoundAndFileName(round, fileName);
            }
        }

        if (files != null) {
            fileToS3(exhibitionInfo, files);
        }

        // 박람회 정보 update
        Integer cnt = exhibitionInfoMapper.update(exhibitionInfo);

        return cnt == 1;
    }

    // 파일 등록 메소드
    public void fileToS3(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException {
        // 파일등록
        for (MultipartFile file : files) {
            if (file.getSize() > 0) {
                String objectKey = "career_fair/exhibitionInfo/" + exhibitionInfo.getRound() + "/" + file.getOriginalFilename();

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
                exhibitionInfoMapper.insertFileName(exhibitionInfo.getRound(), file.getOriginalFilename());
            }
        }
    }

    // 파일 삭제 메소드
    public void removeFromS3(Integer round, String fileName) {
        // 파일 삭제
        String objectKey = "career_fair/exhibitionInfo/" + round + "/" + fileName;

        DeleteObjectRequest dor = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(objectKey)
                .build();
        s3.deleteObject(dor);
    }
}
