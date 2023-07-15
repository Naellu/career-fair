package com.project.careerfair.service.generalmember;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.generalmember.UserPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserPageServiceImpl implements UserPageService {

    @Autowired
    private UserPageMapper userMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Members get(String id) {
        return userMapper.selectById(id);
    }

    @Override
    public boolean modifyAccount(Members member, String oldPassword){

        // 비밀번호를 바꾸기 위해 입력헀으면
        if (!member.getPassword().isBlank()){

            //입력한 비밀번호를 암호화
            String encryption = member.getPassword();
            member.setPassword(passwordEncoder.encode(encryption));
        }
        Members oldMember = userMapper.selectById(member.getId());
        int cnt = 0;

        if(passwordEncoder.matches(oldPassword, oldMember.getPassword())){
            // 기존 비밀번호와 같다면
            cnt = userMapper.modify(member);

//            if(member.getAuthority() != null){
//                userMapper.updateAuthority(member);
//            }
        }
        return cnt == 1;
    }
    @Override
    public boolean removeAccout(Members member) {
        Members oldMember = userMapper.selectById(member.getId());

        int cnt = 0;
        if(passwordEncoder.matches(member.getPassword(), oldMember.getPassword())) {
        //암호가 같은면

        //회원 테이블 0번으로 변경
//        userMapper.deleteAuthority(member.getId());

        cnt = userMapper.deleteById(member.getId(), 0);
        }
        return cnt == 1;
    }

    @Override
    public boolean findActive(String id, Integer isActive) {
        Members activeMember = userMapper.selectByActiveMember(id, isActive);
        return activeMember != null;
    }
}
