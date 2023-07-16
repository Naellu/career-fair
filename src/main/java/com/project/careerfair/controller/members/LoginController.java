package com.project.careerfair.controller.members;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("login")
public class LoginController {

    @GetMapping("login")
    public void loginForm() {

    }
    @PostMapping("login")
    public String loginProcess() {
        return "redirect:/";
    }




}
