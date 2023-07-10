package com.project.careerfair.controller.members;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member/")
public class UserMyPageController {

    @GetMapping("user/mypage")
    public String myPage2() {
        return "member/user/mypage";
    }
}
