package com.project.careerfair.service.member;

import com.project.careerfair.domain.Members;

import java.util.Map;

public interface MemberService {

    public boolean signup(Members member);

    public Map<String, Object> checkId(String id);
}
