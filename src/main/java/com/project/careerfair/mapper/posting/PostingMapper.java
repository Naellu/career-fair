package com.project.careerfair.mapper.posting;

import com.project.careerfair.domain.Posting;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostingMapper {
    List<Posting> getNowPostingList(Integer companyId);

    Integer countAll(Integer companyId);

    List<Posting> getPastPostingList(Integer startNum, Integer pageSize, Integer companyId);
}
