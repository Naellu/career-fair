package com.project.careerfair.service.member;

import com.project.careerfair.domain.Members;
import jakarta.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;

import java.util.Map;

public interface MemberService {

    public boolean signup(Members member);

    public Map<String, Object> checkId(String id);

    public Map<String, Object> checkPhoneNum(String phoneNumber, Authentication authentication);

    public Map<String, Object> checkMailId(String email, Authentication authentication);

    public String findId(String email, String name);

    // 이메일 체크
    Map<String, Object> checkEmail(String email);

    Map<String, Object> active(Map<String, Object> map, HttpSession session);
}
