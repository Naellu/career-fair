package com.project.careerfair.mapper.resume;

import com.project.careerfair.domain.*;
import com.project.careerfair.domain.dto.ResumeDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResumeMapper {

    // -- 이력서 목록 -- //
    List<Resume> findByMemberId(String memberId);


    // -- 이력서 등록 -- //
    Integer createEmptyResume(Resume resume);
    Integer updateResume(Integer resumeId, ResumeDto resumeDto);
    Integer insertCareerByResumeId(Integer resumeId, Career career);
    Integer insertEducationByResumeId(Integer resumeId, Education education);
    Integer insertCertificationByResumeId(Integer resumeId, Certification certification);
    Integer insertWorkAreaByResumeId(Integer resumeId, WorkArea workArea);
    Integer insertWorkConditionByResumeId(Integer resumeId, WorkCondition workCondition);

    // -- 이력서 상세 -- //
    ResumeDto getResumeById(Integer resumeId);
}
