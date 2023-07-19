package com.project.careerfair.service.admin;

import com.project.careerfair.domain.Statistic;
import com.project.careerfair.domain.dto.statistic.IndustryAgeGroupDto;
import com.project.careerfair.domain.dto.statistic.IndustryCount;
import com.project.careerfair.mapper.statistic.StatisticMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class StatisticServiceImpl implements StatisticService{

    private final StatisticMapper statisticMapper;

    @Override
    public List<Statistic> getAllPostings() {
        return statisticMapper.getAllPostings();
    }

    @Override
    public List<IndustryCount> getAllPostingByIndustry() {
        return statisticMapper.getAllPostingByIndustry();
    }

    @Override
    public List<IndustryAgeGroupDto> getIndustryAgeGroupData() {
        return statisticMapper.getIndustryAgeGroupData();
    }

    @Override
    public List<IndustryCount> getAllApplicantsByIndustry() {
        return statisticMapper.getAllApplicantsByIndustry();
    }
}
