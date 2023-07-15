package com.project.careerfair.service.resume;

import com.project.careerfair.domain.Resume;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.mapper.resume.ResumeMapper;
import com.project.careerfair.util.BiFunctionWithReturn;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.function.Function;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService {

    private final ResumeMapper resumeMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    // 개선 예정
    public Integer insertResumeData(ResumeDto resumeDto, String memberId) {

        // 빈 이력서 생성
        Resume resume = new Resume();
//        String memberId = authentication.getName();
        resume.setMemberId(memberId);

        resumeMapper.createEmptyResume(resume);

        // 빈 이력서에서 resumeId 가져오기
        Integer resumeId = resume.getResumeId();

        if (resumeId != null && resumeId > 0) {
            resumeMapper.insertResumeBasics(resumeId, resumeDto);

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



    @Override
    public List<Resume> findByMemberId(String memberId) {
        return resumeMapper.findByMemberId(memberId);
    }

    @Override
    public ResumeDto getResumeById(Integer resumeId) {
        return resumeMapper.getResumeById(resumeId);
    }

    // memberId, resumeId로 해당 이력서가 존재하는지 확인
    @Override
    public Integer checkResumeByMemberId(String memberId, Integer resumeId) {
        return resumeMapper.checkResumeByMemberId(memberId, resumeId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer updateResumeData(ResumeDto resumeDto) {
        resumeMapper.updateResumeBasics(resumeDto);
        updateData(resumeDto.getCareers(), resumeMapper::updateCareerByResumeId);
        updateData(resumeDto.getEducations(), resumeMapper::updateEducationByResumeId);
        updateData(resumeDto.getCertifications(), resumeMapper::updateCertificationByResumeId);
        updateData(resumeDto.getWorkAreas(), resumeMapper::updateWorkAreaByResumeId);
        resumeMapper.updateWorkConditionByResumeId(resumeDto.getWorkCondition());

        return resumeDto.getResumeId();
    }

    private <T> void insertData(List<T> items, Integer resumeId, BiFunctionWithReturn<Integer, T> inserter) {
        for (T item : items) {
            inserter.apply(resumeId, item);
        }
    }

    private <T> void updateData(List<T> items, Function<T, Integer> updater) {
        for (T item : items) {
            updater.apply(item);
        }
    }

}
