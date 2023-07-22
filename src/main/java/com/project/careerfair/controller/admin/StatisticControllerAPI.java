package com.project.careerfair.controller.admin;

import com.project.careerfair.domain.Statistic;
import com.project.careerfair.domain.dto.statistic.IndustryAgeGroupDto;
import com.project.careerfair.domain.dto.statistic.IndustryCount;
import com.project.careerfair.service.admin.StatisticService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/vi/stat/")
public class StatisticControllerAPI {

    private final StatisticService statisticService;

    @GetMapping("postings")
    public List<Statistic> getStatData() {
        return statisticService.getAllPostings();
    }

    @GetMapping("industry/age")
    public List<IndustryAgeGroupDto> showIndustryAgeGroupData() {
        List<IndustryAgeGroupDto> industryAgeGroupData = statisticService.getIndustryAgeGroupData();
        log.info("industryAgeGroupData={}", industryAgeGroupData);
        return industryAgeGroupData;
    }

    @GetMapping("industry/postings")
    public List<IndustryCount> showAllPostingByIndustry() {
        List<IndustryCount> allPostings = statisticService.getAllPostingByIndustry();
        return allPostings;
    }

    @GetMapping("industry/member")
    public List<IndustryCount> showAllApplicantsMemberByIndustry() {
        List<IndustryCount> allApplicantsByIndustry = statisticService.getAllApplicantsByIndustry();
        return allApplicantsByIndustry;
    }


}
