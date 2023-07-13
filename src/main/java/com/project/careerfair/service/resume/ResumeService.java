package com.project.careerfair.service.resume;

import com.project.careerfair.domain.Resume;
import com.project.careerfair.domain.dto.ResumeDto;
import org.springframework.security.core.Authentication;

import java.util.List;

public interface ResumeService {
    Integer insertResumeData(ResumeDto resumeDto, Authentication authentication);

    List<Resume> findByMemberId(String memberId);

    ResumeDto getResumeById(Integer resumeId);

}
