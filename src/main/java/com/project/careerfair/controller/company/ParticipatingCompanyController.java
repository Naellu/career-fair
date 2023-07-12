package com.project.careerfair.controller.company;

import com.project.careerfair.service.admin.ExhibitionInfoService;
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
        return "company/list";
    }

    @GetMapping("{companyId}")
    public String detail(
            @PathVariable Integer companyId,
            Model model) {
        model.addAttribute("kakaoMap", accessKey);
        return "company/detail";
    }
}
