package com.project.careerfair.controller;

import com.project.careerfair.domain.exhibitionInfo.ExhibitionInfo;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomeController {

    @Value("${kakao.accessKey}")
    private String accessKey;

    private final ExhibitionInfoService exhibitionInfoService;

//    @GetMapping
//    public String home() {
//        return "main";
//    }

    @GetMapping
    public String jobMain(Model model) {
        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
        model.addAttribute("exhibitionInfo", exhibitionInfo);
        return "job-main";
    }

    @GetMapping("location")
    public String location(Model model) {
        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
        model.addAttribute("kakaoMap", accessKey);
        model.addAttribute("exhibitionInfo", exhibitionInfo);
        return "exhibitionInfo/location";
    }

    @GetMapping("info")
    public String info(Model model) {
        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
        model.addAttribute("exhibitionInfo", exhibitionInfo);
        return "exhibitionInfo/info";
    }

    @GetMapping("deny-email")
    public String denyCollectEmail() {
        return "denycollectemail";
    }
    @GetMapping("policy")
    public String policy() {
        return "personalprocessingpolicy";
    }
    @GetMapping("clause")
    public String clause() {
        return "clause";
    }
}
