package com.project.careerfair.service.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.members.MemberMapper;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
@Slf4j
public class MemberServiceImpl implements MemberService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberMapper mapper;

    @Override
    public boolean signup(Members member) {
        //비밀번호 암호화
        String encryption = member.getPassword();
        if (encryption.length() > 50) {
            encryption = encryption.substring(0, 50);
        }
        String encryptedPassword = passwordEncoder.encode(encryption);
        member.setPassword(encryptedPassword);

        int cnt = mapper.signUpInsert(member);
//        mapper.insertAuthority(member);
        return cnt == 1;
    }

    @Override
    public Map<String, Object> checkId(String id) {
        Members member = mapper.selectByMemberId(id);
        boolean available = (member == null);
        return Map.of("available", member == null);
    }

    @Override
    public Map<String, Object> checkMailId(String email, Authentication authentication) {
        Members member = mapper.selectByMailId(email);
        if (authentication != null) {
            Members exMember = mapper.selectByMemberId(authentication.getName());

            return Map.of("available", member == null || exMember.getEmail().equals(email));
        } else {
            return Map.of("available", member == null);
        }
    }


    @Override
    public Map<String, Object> checkPhoneNum(String phoneNumber, Authentication authentication) {
        Members member = mapper.selectByPhoneNumber(phoneNumber);
        if (authentication != null) {
            Members exMember = mapper.selectByMemberId(authentication.getName());

            return Map.of("available", member == null || exMember.getPhoneNumber().equals(phoneNumber));
        } else {

            return Map.of("available", member == null);
        }
    }

    @Override
    public String findId(String email, String name) {
        String result = "";

        try {
            result = mapper.findId(email, name);

        } catch (Exception e) {

            e.printStackTrace();
        }

        return result;
    }

    @Override
    public Map<String, Object> checkEmail(String memberId) {

        Members checkMember = mapper.selectByMemberId(memberId);

        if (checkMember == null) {
            return Map.of("status", "notFound");
        } else {
            String email = checkMember.getEmail();
            return Map.of("status", "found", "email", email);
        }
    }

    // 비활성화 아이디 해제
    @Override
    public Map<String, Object> active(Map<String, Object> map, HttpSession session) {
        String inputAuthCode_ = (String) map.get("inputAuthCode");
        Integer inputAuthCode = Integer.parseInt(inputAuthCode_);

        Object memberId = map.get("memberId");
        Integer authCode = (Integer) session.getAttribute("authenticatedNum");

        if (authCode.equals(inputAuthCode)) {
            mapper.active(memberId);
            return Map.of("message", "success");
        } else {
            return Map.of("message", "fail");
        }
    }

    @Override
    public String checkUser(String id, String email) {

        String result = mapper.findMemberId(email, id);
        return (result != null) ? result : null; // 실패 시 null 리턴
    }

}

