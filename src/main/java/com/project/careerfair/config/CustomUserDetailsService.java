package com.project.careerfair.config;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.members.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final MemberMapper mapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Members members = mapper.selectByMemberId(username);

        if (members == null) {
            throw new UsernameNotFoundException(username + "해당 회원 조회 불가");
        }

        boolean isActive = members.getIsActive() == 1;

        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

        for (String auth : members.getAuthority()) {
            authorityList.add(new SimpleGrantedAuthority(auth));
        }

        UserDetails user = User.builder()
                .username(members.getId())
                .disabled(!isActive)
                .password(members.getPassword())
                .authorities(List.of())
                .authorities(members.getAuthority().stream().map(SimpleGrantedAuthority::new).toList())
                .build();

        return user;
    }


}
