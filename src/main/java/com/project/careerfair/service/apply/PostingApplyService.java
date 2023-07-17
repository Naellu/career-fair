package com.project.careerfair.service.apply;

import com.project.careerfair.domain.JobApplication;

import java.util.List;
import java.util.Map;

public interface PostingApplyService {
    Map<String, Object> getApplyList(String memberId);
}
