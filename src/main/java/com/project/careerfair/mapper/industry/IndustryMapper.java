package com.project.careerfair.mapper.industry;

import com.project.careerfair.domain.Industry;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IndustryMapper {
    List<Industry> getIndustryList();

    Industry findIndustryNameById(Integer industryId);

    List<Industry> getIndustryListWithRound(Integer round);
}
