package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.generalmember.UserPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("login")
public class LoginController {

    private final UserPageService userService;

    @GetMapping("login")
    public void loginForm() {

    }
    @PostMapping("login")
    @PreAuthorize("isAuthenticated() and @customSecurityCheck.checkIsActive(authentication,#id)")
    public String loginProcess(RedirectAttributes rttr, Members member) {
        boolean isActive = userService.findActive(member.getId(), 1);

        if (!isActive) {
            rttr.addFlashAttribute("message", "아이디가 비활성화 상태입니다.");
            return "redirect:/activationPage";
        }

        return "redirect:/";
    }

}
