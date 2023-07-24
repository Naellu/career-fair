package com.project.careerfair.service.admin;

import java.util.Map;

public interface RecruitManageService {

    public boolean removeProcess(Integer postingId);

    public Map<String, Object> getPosting(Integer page, String search, String type, String roundValue);

    boolean jobEndForm(Integer postingId);
}
