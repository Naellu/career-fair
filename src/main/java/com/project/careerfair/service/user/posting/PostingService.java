package com.project.careerfair.service.user.posting;

import com.project.careerfair.domain.JobApplication;
import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

public interface PostingService {
    Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer page);

    Map<String, Object> getDetail(Integer postingId, Authentication authentication);

    // 지원하기전 날짜, 지원자수, 로그인 상황체크
    Map<String, Object> beforeApplyCheck(Integer postingId, Authentication authentication);

    Map<String, Object> apply(JobApplication jobApplication, MultipartFile[] files, Authentication authentication) throws IOException;
}
