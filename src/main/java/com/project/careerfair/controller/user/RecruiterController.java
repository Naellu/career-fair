package com.project.careerfair.controller.user;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userRecruiterController")
@Slf4j
@RequestMapping("/user/recruiter/")
public class RecruiterController {

    @Value("${current.event}")
    String round;

    @GetMapping("reg")
    public String list(Model model) {
        model.addAttribute("round", round);
        return "user/recruiter/reg";
    }
}
