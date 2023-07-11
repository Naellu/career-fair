package com.project.careerfair.service.resume;

import com.project.careerfair.domain.*;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.mapper.resume.ResumeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService {

    private final ResumeMapper resumeMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    // 개선 예정
    public Integer insertResumeData(ResumeDto resumeDto, Authentication authentication) {

        // 빈 이력서 생성
        Resume resume = new Resume();
        String memberId = authentication.getName();
        resumeMapper.createEmptyResume(resume);

        // 빈 이력서에서 resumeId 가져오기
        Integer resumeId = resume.getResumeId();

        // 가져온 resumeId로
        // 경력, 학력, 자격증, 근무지역, 근무조건 테이블에 resumeId 등록 후 insert
        List<Career> careers = resumeDto.getCareers();
        for (Career career : careers) {
            career.setResumeId(resumeId);
            resumeMapper.insertCareerByResumeId(career);
        }

        List<Education> educations = resumeDto.getEducations();
        for (Education education : educations) {
            education.setResumeId(resumeId);
            resumeMapper.insertEducationByResumeId(education);
        }

        List<Certification> certifications = resumeDto.getCertifications();
        for (Certification certification : certifications) {
            // 작성 예정
        }

        List<WorkArea> workAreas = resumeDto.getWorkAreas();
        for (WorkArea workArea : workAreas) {
            // 작성 예정
        }

        WorkCondition workCondition = resumeDto.getWorkCondition();


        return resumeId;
    }
}
