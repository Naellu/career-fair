package com.project.careerfair.mapper.statistic;

import com.project.careerfair.domain.Statistic;
import com.project.careerfair.domain.dto.statistic.IndustryAgeGroupDto;
import com.project.careerfair.domain.dto.statistic.IndustryCount;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StatisticMapper {

    List<Statistic> getAllPostings();

    List<IndustryCount> getAllPostingByIndustry();

    List<IndustryAgeGroupDto> getIndustryAgeGroupData();

    List<IndustryCount> getAllApplicantsByIndustry();

}
