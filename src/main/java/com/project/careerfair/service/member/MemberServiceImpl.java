package com.project.careerfair.service.member;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.members.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class MemberServiceImpl implements MemberService{

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberMapper mapper;

    @Override
    public boolean signup(Members member) {
        //비밀번호 암호화
        String encryption = member.getPassword();
        if(encryption.length() > 50) {
            encryption = encryption.substring(0,50);
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
        return Map.of("available",member == null);
    }

    @Override
    public Map<String, Object> checkMailId(String email, Authentication authentication) {
        Members member = mapper.selectByMailId(email);
        if(authentication != null) {
            Members exMember = mapper.selectByMemberId(authentication.getName());

            return Map.of("available", member == null || exMember.getEmail().equals(email));
        }else {
            return Map.of("available" , member == null);
        }
    }

    @Override
    public Map<String, Object> checkPhoneNum(String phoneNumber, Authentication authentication) {
        Members member = mapper.selectByPhoneNumber(phoneNumber);
        if(authentication != null) {
            Members exMember = mapper.selectByMemberId(authentication.getName());

            return Map.of("available", member == null || exMember.getPhoneNumber().equals(phoneNumber));
        } else {

            return Map.of("available", member == null);
        }
        }
    }
