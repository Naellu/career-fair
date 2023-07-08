package com.project.careerfair.mapper.exhibitionInfo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExhibitionInfoMapper {

    Integer getCurrentRound();
}
