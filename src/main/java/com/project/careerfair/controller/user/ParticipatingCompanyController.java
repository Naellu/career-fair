package com.project.careerfair.controller.user;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/company/")
public class ParticipatingCompanyController {

    @GetMapping("list")
    public String list(){
        return "user/company/list";
    }
}
