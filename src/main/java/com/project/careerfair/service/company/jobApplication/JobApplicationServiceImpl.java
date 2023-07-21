package com.project.careerfair.service.company.jobApplication;

import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.jobapplication.JobApplicationMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.s3.S3Client;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JobApplicationServiceImpl implements JobApplicationService{

    private final S3Client amazonS3;

    private final JobApplicationMapper mapper;

    @Value("${aws.bucketUrl}")
    private String bucket;

    @Override
    public List<JobApplication> getList(Integer postingId) {

        List<JobApplication> list = mapper.applyList(postingId);

        return list;
    }

    @Override
    public List<Members> getDetails(String memberId) {

        List<Members> list = mapper.getDetails(memberId);

        return list;
    }

    @Override
    public List<String> getFileDetails(Integer applicationId) {

        List<String> files = mapper.getFileDetails(applicationId);
        return files;
    }
    @Override
    public void updateStatus(String memberId, Integer applicationId, String applicationStatus, Integer postingId) {

        mapper.updateStatus(memberId, applicationId, applicationStatus, postingId);
    }

}
