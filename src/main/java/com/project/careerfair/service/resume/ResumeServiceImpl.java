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

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService {

    private final ResumeMapper resumeMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer insertResumeData(ResumeDto resumeDto, String memberId) {

        // 빈 이력서 생성
        Resume resume = new Resume();
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

    @Override
    public Integer deleteResume(Integer resumeId) {
        resumeMapper.deleteCareerByResumeId(resumeId);
        resumeMapper.deleteEducationByResumeId(resumeId);
        resumeMapper.deleteCertificationByResumeId(resumeId);
        resumeMapper.deleteWorkAreaByResumeId(resumeId);
        resumeMapper.deleteWorkConditionByResumeId(resumeId);

        return resumeMapper.deleteResumeById(resumeId);
    }

    @Override
    public Map<String, Object> findAllByIndustry(Integer page, Integer[] industries) {
        // 페이지당 행의 수
        Integer rowPerPage = 5;

        // 쿼리 LIMIT 절에 사용할 시작 인덱스
        Integer startIndex = (page - 1) * rowPerPage;

        // 페이지네이션이 필요한 정보
        // 전체 레코드 수
        Integer numOfRecords = resumeMapper.countResumeByIndustry(industries);
        // 마지막 페이지 번호
        Integer lastPageNumber = (numOfRecords - 1) / rowPerPage + 1;
        // 페이지네이션 왼쪽번호
        Integer leftPageNum = page - 5;
        // 1보다 작을 수 없음
        leftPageNum = Math.max(leftPageNum, 1);

        // 페이지네이션 오른쪽번호
        Integer rightPageNum = leftPageNum + 9;
        // 마지막페이지보다 클 수 없음
        rightPageNum = Math.min(rightPageNum, lastPageNumber);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("lastPageNum", lastPageNumber);

        // 게시물 목록
        List<Resume> resumeOfIndustry = resumeMapper.findAllByIndustry(startIndex, rowPerPage, industries);

        return Map.of("pageInfo", pageInfo,
                "resumeList", resumeOfIndustry);
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
