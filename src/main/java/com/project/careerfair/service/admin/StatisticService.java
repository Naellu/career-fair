package com.project.careerfair.service.admin;

import com.project.careerfair.domain.Statistic;
import com.project.careerfair.domain.dto.statistic.IndustryAgeGroupDto;
import com.project.careerfair.domain.dto.statistic.IndustryCount;

import java.util.List;

public interface StatisticService {

    List<Statistic> getAllPostings();

    List<IndustryCount> getAllPostingByIndustry();

    List<IndustryAgeGroupDto> getIndustryAgeGroupData();

    List<IndustryCount> getAllApplicantsByIndustry();

}
