package com.project.careerfair.service.company;

import java.util.Map;

public interface ParticipatingCompanyService {
    Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue, Integer page);

    Map<String, Object> getDetail(Integer companyId, Integer page);
}
