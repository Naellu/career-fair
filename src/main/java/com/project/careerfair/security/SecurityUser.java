package com.project.careerfair.security;

import com.project.careerfair.domain.Members;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class SecurityUser extends User {
    private Members members;

    public SecurityUser(Members members) {
        super(members.getId(), members.getPassword(),
                AuthorityUtils.createAuthorityList(members.get));
    }
}
