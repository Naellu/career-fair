package com.project.careerfair.controller.user;

import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userRecruiterController")
@Slf4j
@RequestMapping("/user/recruiter/")
@RequiredArgsConstructor
public class RecruiterController {

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping("reg")
    public String list(Model model) {
        Integer round = exhibitionInfoService.getCurrentRound();
        model.addAttribute("round", round);
        return "user/recruiter/reg";
    }
}
