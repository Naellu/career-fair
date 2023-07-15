package com.project.careerfair.config;

import com.project.careerfair.domain.Members;
import com.project.careerfair.mapper.generalmember.UserPageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

@Component
public class CustomSecurityChecker {

    @Autowired
    private UserPageMapper userMapper;

    public boolean checkIsActive (Authentication authentication, String id, Integer isActive){

        Members activeMember = userMapper.selectByActiveMember(id, isActive);
        
        return activeMember != null && activeMember.getId().equals(authentication.getName());
    }
}
