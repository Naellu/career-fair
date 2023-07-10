package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Company;

import java.util.Map;

public interface PostingService {
    Map<String, Object> getCompanyInfo(String userId);
}
