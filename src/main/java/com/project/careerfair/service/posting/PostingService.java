package com.project.careerfair.service.posting;

import java.util.Map;

public interface PostingService {
    Map<String, Object> getCompanyInfo(String userId);

    Map<String, Object> getPostingInfo(String memberId, Integer page);
}
