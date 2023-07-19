package com.project.careerfair.controller;

import com.project.careerfair.domain.ExhibitionInfo;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomeController {

    @Value("${kakao.accessKey}")
    private String accessKey;

    private final ExhibitionInfoService exhibitionInfoService;

    @GetMapping
    public String home() {
        return "main";
    }

    // navBar 출력 테스트 페이지
    @GetMapping("test")
    public String test() {
        return "test";
    }

    @GetMapping("location")
    public String location(Model model) {
        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
        model.addAttribute("kakaoMap", accessKey);
        model.addAttribute("exhibitionInfo", exhibitionInfo);
        return "exhibitionInfo/location";
    }
}
