package com.project.careerfair.service.user;

import java.util.Map;

public interface ParticipatingCompanyService {
    Map<String, Object> getList(String search, String type, Integer industryId, Integer roundValue);
}
