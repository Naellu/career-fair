package com.project.careerfair.service.company;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.mapper.company.RecruitManageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecruitManageServiceImpl implements RecruitManageService{

    @Autowired
    private RecruitManageMapper rmMapper;

    @Override
    public Members getRecruterId(String id){

        return rmMapper.getId(id);

    }

    @Override
    public Posting getPosting(String id) {

        return rmMapper.getPostId(id);
    }
//    @Override
//    public List<Posting> getRecrutList(String memberId){
//        List<Posting> list = rmMapper.recuruitList(memberId);
//
//        return list;
//    }
}
