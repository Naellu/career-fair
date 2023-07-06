package com.project.careerfair.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping
    public String home() {
        return "main";
    }

    // navBar 출력 테스트 페이지
    @GetMapping("test")
    public String test() {
        return "test";
    }
}
