package com.project.careerfair.mapper.jobapplication;

import com.project.careerfair.domain.JobApplication;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JobApplicationMapper {
    Integer apply(JobApplication jobApplication);

    void insertFileName(Integer applicationId, String originalFilename);
}
