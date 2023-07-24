package com.project.careerfair.service.apply;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.files.FileMapper;
import com.project.careerfair.mapper.jobapplication.JobApplicationMapper;
import com.project.careerfair.mapper.posting.PostingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

import java.util.*;

@Service
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class PostingApplyServiceImpl implements PostingApplyService{

    private final JobApplicationMapper jobApplicationMapper;
    private final PostingMapper postingMapper;
    private final FileMapper fileMapper;
    private final CompanyMapper companyMapper;

    private final S3Client s3;
    @Value("${aws.s3.bucketName}")
    private String bucketName;
    @Override
    public Map<String, Object> getApplyList(String memberId) {
        Map<String, Object> resultMap = new HashMap<>();

        List<JobApplication> applyList = jobApplicationMapper.getApplyList(memberId);
        List<Posting> postingDetails = new ArrayList<>();
        List<Company> companyList = new ArrayList<>();

        for (JobApplication apply : applyList){
            Posting posting = postingMapper.getPostViewDetailByPostingId(apply.getPostingId());
            postingDetails.add(posting);
            companyList.add(companyMapper.getDetail(posting.getCompanyId()));
        }
        resultMap.put("applyList", applyList);
        resultMap.put("post", postingDetails);
        resultMap.put("companyList",companyList);

        return resultMap;
    }

    @Override
    public Map<String, Object> getApplyInfo(Integer applicationId) {
        Map<String, Object> result = new HashMap<>();
        JobApplication application = jobApplicationMapper.getApplyInfo(applicationId);

        List<String> fileNames = fileMapper.getFileNamesByApplicationId(applicationId);
        result.put("application", application);
        result.put("posting", postingMapper.getPostDetailByPostingId(application.getPostingId()));
        result.put("fileNames", fileNames);

        return result;
    }

    @Override
    public Boolean applyCancel(Integer applicationId) {

        List<String> fileNames = fileMapper.getFileNamesByApplicationId(applicationId);

        for (String fileName : fileNames){
            String dirKey = "career_fair/jobApplication/" + applicationId;
            String fileKey = dirKey + "/" + fileName;

            DeleteObjectRequest dor = DeleteObjectRequest.builder()
                    .bucket(bucketName)
                    .key(fileKey)
                    .build();

            s3.deleteObject(dor);

            fileMapper.deleteFileByFileName(fileName);
        }

        JobApplication application = jobApplicationMapper.getApplyInfo(applicationId);
        Integer check = jobApplicationMapper.cancelApplyByApplicationId(applicationId);
        System.out.println(application);

        if (check==1) {
            postingMapper.reduceApplcationCount(application.getPostingId());
        }

        return check == 1;
    }
}
