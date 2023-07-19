package com.project.careerfair.mapper.exhibitionInfo;

import com.project.careerfair.domain.ExhibitionInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExhibitionInfoMapper {

    Integer getCurrentRound();

    ExhibitionInfo getCurrentInfo(Integer round);

    Integer insert(ExhibitionInfo exhibitionInfo);

    void insertFileName(Integer round, String originalFilename);
}
