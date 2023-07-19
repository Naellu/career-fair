package com.project.careerfair.service.company;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;

public interface RecruitManageService {
//    public List<Posting> getRecrutList(String memberId);

    public Members getRecruterId(String id);

    public Posting getPosting(String id);
}
