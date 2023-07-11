package com.project.careerfair.service.resume;

import com.project.careerfair.domain.dto.ResumeDto;
import org.springframework.security.core.Authentication;

public interface ResumeService {
    Integer insertResumeData(ResumeDto resumeDto, Authentication authentication);

}
