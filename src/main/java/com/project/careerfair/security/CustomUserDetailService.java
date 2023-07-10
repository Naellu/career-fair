/*
package com.project.careerfair.security;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Component
public class CustomUserDetailServic implements UserDetailsService {

    @Autowired
    private MemberMapper mapper;

    @Override
    public UserDetails loadUserByNames(String username) throws UsernameNotFoundException {
        Members member = mapper.selectById(username);

        if(member == null) {
            throw new UsernameNotFoundException(username + "회원이 없습니다.");
        }

        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

        for (String auth : member.getMember_type()){
            authorityList.add(new SimpleGrantedAuthority(auth));
        }

        UserDetails user = User.builder()
                .username(member.getMember_id())
                .password(member.getPassword())
                .authorities(Collections.singletonList(new SimpleGrantedAuthority(member.getMember_type())))
                .build();
        return user;
    }

}
*/