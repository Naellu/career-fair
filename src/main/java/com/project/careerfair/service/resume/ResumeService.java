package com.project.careerfair.service.resume;

import com.project.careerfair.domain.Resume;
import com.project.careerfair.domain.dto.ResumeDto;
import org.springframework.security.core.Authentication;

import java.util.List;
import java.util.Map;

public interface ResumeService {
    Integer insertResumeData(ResumeDto resumeDto, String memberId);

    List<Resume> findByMemberId(String memberId);

    ResumeDto getResumeById(Integer resumeId);

    Integer checkResumeByMemberId(String memberId, Integer resumeId);

    Integer updateResumeData(ResumeDto resumeDto);

    Integer deleteResume(Integer resumeId);

    Map<String, Object> findAllByIndustry(Integer page, Integer[] industries);

}
