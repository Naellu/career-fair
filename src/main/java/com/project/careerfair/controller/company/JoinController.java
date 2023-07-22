package com.project.careerfair.controller.company;

import com.project.careerfair.domain.Company;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("companyJoinController")
@Slf4j
@RequestMapping("/company/join/")
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('recruiter') or hasAuthority('admin') or hasAuthority('company')")
public class JoinController {

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping("reg")
    public String reg(Model model) {
        Integer round = exhibitionInfoService.getCurrentRound();
        model.addAttribute("round", round);
        model.addAttribute("company", new Company());
        return "company/join/reg";
    }

    @GetMapping("list")
    public String list(Authentication authentication, Model model) {
        if (authentication!= null){
            model.addAttribute("memberId", authentication.getName());
        }
        return "company/join/list";
    }

    @GetMapping("{companyId}")
    public String detail(@PathVariable("companyId") Integer companyId) {
        return "company/join/detail";
    }

    @GetMapping("/modify/{companyId}")
    public String modify(@PathVariable("companyId") Integer companyId) {
        return "company/join/modify";
    }
}
