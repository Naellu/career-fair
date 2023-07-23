package com.project.careerfair.service.user.join;

import java.util.Map;

public interface JoinCompanyService {
    Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue, Integer page);

    Map<String, Object> getDetail(Integer companyId, Integer page, Integer pageNow);
}
