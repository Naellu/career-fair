package com.project.careerfair.controller.admin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.domain.Statistic;
import com.project.careerfair.service.admin.StatisticService;
import com.project.careerfair.service.posting.PostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/stat")
@RequiredArgsConstructor
public class StatisticController {

    private final StatisticService statisticService;
//
//    @GetMapping
//    public String test(Model model) {
//        List<Statistic> statistics = statisticService.getAllPostings();
//        log.info("statistics ={}", statistics);
//        model.addAttribute("statistics", statistics);
//        log.info("model ={}", model);
//        return "admin/statistic/testStat";
//    }

    @ResponseBody
    @GetMapping("")
    public ResponseEntity<List<Statistic>> test() {
        List<Statistic> statistics = statisticService.getAllPostings();
        log.info("statistics ={}", statistics);
        return ResponseEntity.ok(statistics);
    }
}
