package com.project.careerfair.service.posting;

import org.springframework.security.core.Authentication;

import java.util.Map;

public interface UserPostingService {
    Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer page);

    Map<String, Object> getDetail(Integer postingId, Authentication authentication);
}
