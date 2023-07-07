package com.project.careerfair.service;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        return Map.of("available",member == null);
    }
}
