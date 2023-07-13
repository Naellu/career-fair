package com.project.careerfair.service.member;

import com.project.careerfair.domain.Members;

public interface UserPageService {

    public Members get(String id);

    public boolean modifyAccount(Members member, String oldPassword);

    public boolean removeAccout(Members member);
}
