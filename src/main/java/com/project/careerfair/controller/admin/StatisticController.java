package com.project.careerfair.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@PreAuthorize("hasAuthority('admin')")
@RequestMapping("/admin/stat/")
public class StatisticController {

    @GetMapping
    public String showGraph() {
        return "admin/statistic/stat";
    }

}
