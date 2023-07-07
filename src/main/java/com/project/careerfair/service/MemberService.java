package com.project.careerfair.service;

import com.project.careerfair.domain.Members;

import java.util.Map;

public interface MemberService {

    public boolean signup(Members member);

    public Map<String, Object> checkId(String id);
}
