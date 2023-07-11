package com.project.careerfair.mapper.resume;

import com.project.careerfair.domain.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeMapper {

    Integer createEmptyResume(Resume resume);

    Integer insertCareerByResumeId(Career career);
    Integer insertEducationByResumeId(Education education);
    Integer insertCertificationByResumeId(Certification certification);
    Integer insertWorkAreaByResumeId(WorkArea workArea);
    Integer insertWorkConditionByResumeId(WorkCondition workCondition);

}
