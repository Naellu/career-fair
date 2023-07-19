package com.project.careerfair.controller.admin;

import com.project.careerfair.domain.Statistic;
import com.project.careerfair.service.admin.StatisticService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/vi/stat")
public class StatisticControllerAPI {

    private final StatisticService statisticService;

    @GetMapping("/data")
    public List<Statistic> getStatData() {
        return statisticService.getAllPostings();
    }

}
