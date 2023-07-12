package com.project.careerfair.controller.user;

import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("userRecruiterController")
@Slf4j
@RequestMapping("/user/recruiter/")
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('recruiter') or hasAuthority('admin')")
public class RecruiterController {

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping("reg")
    public String reg(Model model) {
        Integer round = exhibitionInfoService.getCurrentRound();
        model.addAttribute("round", round);
        return "user/recruiter/reg";
    }

    @GetMapping("list")
    public String list(Authentication authentication, Model model) {
        if (authentication!= null){
            model.addAttribute("memberId", authentication.getName());
        }
        return "user/recruiter/list";
    }

    @GetMapping("{companyId}")
    public String detail(@PathVariable("companyId") Integer companyId) {
        return "user/recruiter/detail";
    }

    @GetMapping("/modify/{companyId}")
    public String modify(@PathVariable("companyId") Integer companyId) {
        return "user/recruiter/modify";
    }
}
