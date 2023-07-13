package com.project.careerfair.service.posting;

import java.util.Map;

public interface UserPostingService {
    Map<String, Object> getPostings(Integer[] industrIds, String[] experienceLevels, String[] educationLevels, String[] employmentTypes, String type, String search, Integer page);
}
