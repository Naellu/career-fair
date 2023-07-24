package com.project.careerfair.service.admin;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;

import java.util.List;
import java.util.Map;

public interface RecruitManageService {
//    public List<Posting> getRecrutList(String memberId);


//    public boolean removeProcess(Integer appicaitonId, Integer postingId);

    public Map<String, Object> getPosting(Integer page, String search, String type, Integer round);

//    public boolean jobEndForm(Posting posting, String memberId);
}
