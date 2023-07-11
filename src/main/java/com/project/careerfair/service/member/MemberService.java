package com.project.careerfair.service.member;

import com.project.careerfair.domain.Members;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

public interface MemberService {

    public boolean signup(Members member);

    public Map<String, Object> checkId(String id);

    public Map<String, Object> checkPhoneNum(String phoneNumber, Authentication authentication);

    public Map<String, Object> checkMailId(String email, Authentication authentication);

    public String findId(String email, String name);
}
