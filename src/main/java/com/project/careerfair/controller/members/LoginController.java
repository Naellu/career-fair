package com.project.careerfair.controller.members;

import com.project.careerfair.service.members.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("login")
public class LoginController {

    private final MemberService service;

    @GetMapping("login")
    public void loginForm() {

    }
    @PostMapping("login")
    public String loginProcess() {
        return "redirect:/";
    }




}
