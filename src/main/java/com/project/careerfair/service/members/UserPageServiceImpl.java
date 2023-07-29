package com.project.careerfair.service.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.Note.NoteMapper;
import com.project.careerfair.mapper.members.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserPageServiceImpl implements UserPageService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private NoteMapper noteMapper;

    @Override
    public Members get(String id) {
        return memberMapper.selectById(id);
    }

    @Override
    public boolean modifyAccount(Members member, String oldPassword){

        // 비밀번호를 바꾸기 위해 입력헀으면
        if (!member.getPassword().isBlank()){

            //입력한 비밀번호를 암호화
            String encryption = member.getPassword();
            member.setPassword(passwordEncoder.encode(encryption));
        }
//        else {
//            member.setPassword(passwordEncoder.encode(oldPassword));
//        }
        Members oldMember = memberMapper.selectById(member.getId());
        int cnt = 0;
        if(passwordEncoder.matches(oldPassword, oldMember.getPassword())){
            // 기존 비밀번호와 같다면
            cnt = memberMapper.modify(member);

//            if(member.getAuthority() != null){
//                userMapper.updateAuthority(member);
//            }
        }
        return cnt == 1;
    }
    @Override
    public boolean removeAccout(Members member) {
        Members oldMember = memberMapper.selectById(member.getId());

        int cnt = 0;
        if(passwordEncoder.matches(member.getPassword(), oldMember.getPassword())) {
        //암호가 같은면

        //회원 테이블 0번으로 변경
//        userMapper.deleteAuthority(member.getId());

        cnt = memberMapper.deleteById(member.getId(), 0);
        }
        return cnt == 1;
    }

    @Override
    public Integer getUnreadNoteCount(String memberId) {

        return noteMapper.countUnreadListByUserId(memberId);
    }

}
