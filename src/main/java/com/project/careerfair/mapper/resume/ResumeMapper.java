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
    Integer insertResumeBasics(Integer resumeId, ResumeDto resumeDto);
    Integer insertCareerByResumeId(Integer resumeId, Career career);
    Integer insertEducationByResumeId(Integer resumeId, Education education);
    Integer insertCertificationByResumeId(Integer resumeId, Certification certification);
    Integer insertWorkAreaByResumeId(Integer resumeId, WorkArea workArea);
    Integer insertWorkConditionByResumeId(Integer resumeId, WorkCondition workCondition);


    // -- 이력서 존재 확인 -- //
    Integer checkResumeByMemberId(String memberId, Integer resumeId);

    // -- 이력서 상세 -- //
    ResumeDto getResumeById(Integer resumeId);

    // -- 이력서 수정 -- //
    Integer updateResumeBasics(ResumeDto resumeDto);
    Integer updateCareerByResumeId(Career career);
    Integer updateEducationByResumeId(Education education);
    Integer updateCertificationByResumeId(Certification certification);
    Integer updateWorkAreaByResumeId(WorkArea workArea);
    Integer updateWorkConditionByResumeId(WorkCondition workCondition);


    // -- 이력서 삭제 -- //
    Integer deleteResumeById(Integer resumeId);

    Integer deleteCareerByResumeId(Integer resumeId);
    Integer deleteEducationByResumeId(Integer resumeId);
    Integer deleteCertificationByResumeId(Integer resumeId);
    Integer deleteWorkAreaByResumeId(Integer resumeId);
    Integer deleteWorkConditionByResumeId(Integer resumeId);

}
