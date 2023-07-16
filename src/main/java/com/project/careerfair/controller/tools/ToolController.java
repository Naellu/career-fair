package com.project.careerfair.controller.tools;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/tools")
public class ToolController {

    @GetMapping
    public String home() {
        return "tools/tools";
    }

    @GetMapping("/count")
    public String countCharacter() {
        return "tools/count";
    }

    @GetMapping("/grade")
    public String gradeCalculator() {
        return "tools/grade";
    }
}
