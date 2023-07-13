package com.project.careerfair.service.posting;

import com.project.careerfair.domain.Posting;

import java.util.Map;

public interface PostingService {
    Map<String, Object> getCompanyInfo(String userId);

    Map<String, Object> getPostingInfo(String memberId, Integer currentPage, String status);

    Map<String, Object> getPostDetailByPostingId(Integer postingId);

    Boolean addPosting(Posting posting);

    Boolean deletePosting(Posting posting);

    Boolean modifyPosting(Posting posting);
}
