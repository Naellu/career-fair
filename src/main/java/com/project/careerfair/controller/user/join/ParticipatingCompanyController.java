package com.project.careerfair.controller.user.join;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/company/")
public class ParticipatingCompanyController {

    @Value("${kakao.accessKey}")
    private String accessKey;

    @GetMapping("list")
    public String list() {
        return "user/join/list";
    }

    @GetMapping("{companyId}")
    public String detail(
            @PathVariable Integer companyId,
            Model model) {
        model.addAttribute("kakaoMap", accessKey);
        return "user/join/detail";
    }
}
