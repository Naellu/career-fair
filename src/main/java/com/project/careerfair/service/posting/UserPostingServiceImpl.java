package com.project.careerfair.service.posting;

import com.project.careerfair.domain.*;
import com.project.careerfair.mapper.jobapplication.JobApplicationMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import com.project.careerfair.mapper.scrap.ScrapMapper;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserPostingServiceImpl implements UserPostingService {

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    private final PostingMapper postingMapper;

    private final IndustryService industryService;

    private final ScrapMapper scrapMapper;

    private final JobApplicationMapper jobApplicationMapper;

    @Override
    public Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer page) {
        //페이징 시작
        Integer pageSize = 10; //10 20 30
        Integer startNum = (page - 1) * pageSize; //0 10 20

        // 총개수
        Integer count = postingMapper.getNowPostingsCount(industrIds, experienceLevels, educationLevels, employmentTypes, type, search);

        // 최종페이지
        Integer lastPage = (count - 1) / pageSize + 1;

        // 페이징 왼쪽 번호 1, 11, 21
        Integer leftPageNum = (page - 1) / pageSize * pageSize + 1;
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이징 오른쪽 번호
        Integer rightPageNum = leftPageNum + 9;
        rightPageNum = Math.min(rightPageNum, lastPage);

        // 이전 페이지
        Integer prevPageNum = leftPageNum - 10;

        // 다음 페이지
        Integer nextPageNum = leftPageNum + 10;

        Map<String, Integer> pageInfo = new HashMap<>();
        pageInfo.put("lastPageNum", lastPage);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("prevPageNum", prevPageNum);
        pageInfo.put("nextPageNum", nextPageNum);
        pageInfo.put("count", count);

        List<Posting> postingList = postingMapper.getNowPostingsAll(pageSize, startNum, industrIds, experienceLevels, educationLevels, employmentTypes, type, search);

        List<Industry> industryList = industryService.getIndustryList();

        return Map.of("postingList", postingList, "industryList", industryList, "pageInfo", pageInfo);
    }

    @Override
    public Map<String, Object> getDetail(Integer postingId, Authentication authentication) {

        Posting posting = postingMapper.getPostViewDetailByPostingId(postingId);

        List<Industry> industryList = industryService.getIndustryList();

        String senderId = null;

        posting.setScraped(false);

        // 해당 계정이 좋아요눌럿는지와 로그인되어잇는지 체크
        if (authentication == null) {
            senderId = "notLogin";
        } else {
            Scrap scrap = scrapMapper.scrapCheck(postingId, authentication.getName());
            if (scrap != null) {
                posting.setScraped(true);
            }
            senderId = authentication.getName();
        }


        return Map.of("posting", posting, "industryList", industryList, "senderId", senderId);
    }

    // 지원하기전 날짜, 지원자수, 로그인 상황체크
    @Override
    public Map<String, Object> beforeApplyCheck(Integer postingId, Authentication authentication) {

        Posting posting = postingMapper.getPostViewDetailByPostingId(postingId);

        Integer applicationCount = posting.getApplicationCount() + 1;
        Integer spareCount = posting.getSpareCount();
        String endDate = posting.getEndDate();

        Boolean countCheck = false;
        Boolean dateCheck = false;

        // 지원자수 비교
        if (spareCount > applicationCount) {
            countCheck = true;
        }

        // 날짜 비교
        LocalDate now = LocalDate.now();
        LocalDate endDateLocal = LocalDate.parse(endDate, DateTimeFormatter.ISO_DATE);
        if (!now.isAfter(endDateLocal)) {
            dateCheck = true;
        }

        return Map.of("dateCheck", dateCheck, "countCheck", countCheck);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> apply(JobApplication jobApplication, MultipartFile[] files, Authentication authentication) throws IOException {

        Integer postingId = jobApplication.getPostingId();

        // 입사지원자 수 증가
        postingMapper.updateCount(postingId);

        if (authentication != null) {
            jobApplication.setMemberId(authentication.getName());
        }

        // 입사 지원 넣기
        Integer cnt = jobApplicationMapper.apply(jobApplication);

        fileToS3(jobApplication, files);

        log.info("{}", cnt == 1);
        return Map.of("status", cnt == 1);
    }

    // 파일 등록 메소드
    public void fileToS3(JobApplication jobApplication, MultipartFile[] files) throws IOException {
        // 파일등록
        for (MultipartFile file : files) {
            if (file.getSize() > 0) {
                String objectKey = "career_fair/jobApplication/" + jobApplication.getApplicationId() + "/" + file.getOriginalFilename();

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
                jobApplicationMapper.insertFileName(jobApplication.getApplicationId(), file.getOriginalFilename());
            }
        }
    }
}
