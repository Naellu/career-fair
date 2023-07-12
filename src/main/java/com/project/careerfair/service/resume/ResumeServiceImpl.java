package com.project.careerfair.service.resume;

import com.project.careerfair.domain.*;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.mapper.resume.ResumeMapper;
import com.project.careerfair.util.BiFunctionWithReturn;
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
//        String memberId = authentication.getName();
        String memberId = "testUser12345";
        resume.setMemberId(memberId);

        resumeMapper.createEmptyResume(resume);

        // 빈 이력서에서 resumeId 가져오기
        Integer resumeId = resume.getResumeId();

        if (resumeId != null && resumeId > 0) {
            resumeMapper.updateResume(resumeId, resumeDto);

            // 가져온 resumeId로
            // 경력, 학력, 자격증, 근무지역, 근무조건 테이블에 resumeId 등록 후 insert
            insertData(resumeDto.getCareers(), resumeId, resumeMapper::insertCareerByResumeId);
            insertData(resumeDto.getEducations(), resumeId, resumeMapper::insertEducationByResumeId);
            insertData(resumeDto.getCertifications(), resumeId, resumeMapper::insertCertificationByResumeId);
            insertData(resumeDto.getWorkAreas(), resumeId, resumeMapper::insertWorkAreaByResumeId);
            resumeMapper.insertWorkConditionByResumeId(resumeId, resumeDto.getWorkCondition());

        } else {
            throw new RuntimeException();
        }

        return resumeId;
    }

    private <T> void insertData(List<T> items, Integer resumeId, BiFunctionWithReturn<Integer, T> inserter) {
        for (T item : items) {
            inserter.apply(resumeId, item);
        }
    }

}
