package com.project.careerfair.service.apply;

import java.util.Map;

public interface PostingApplyService {
    Map<String, Object> getApplyList(String memberId, Integer page);

    Map<String, Object> getApplyInfo(Integer applicationId);

    Boolean applyCancel(Integer applicationId);

}
