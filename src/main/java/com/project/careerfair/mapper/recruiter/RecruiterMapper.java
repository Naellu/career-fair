package com.project.careerfair.mapper.recruiter;

import com.project.careerfair.domain.Company;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecruiterMapper {

    int insert(Company company);

    void insertFileName(Integer companyId, String originalFilename);
}
