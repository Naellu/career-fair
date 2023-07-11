package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("member/user")
public class UserMyPageController {

    private final MemberService service;

    @GetMapping("mypage")
    public String myPage() {
        return "member/user/mypage";
    }

    @GetMapping("myInfo")
    public void myInfo(String id, Model model) {

        Members members = service.get(id);

        model.addAttribute("members", members);
    }

    @GetMapping("modify")
    @PreAuthorize("isAuthenticated()")
    public String modifyForm() {
        return null;
    }

    @PostMapping("modify")
    @PreAuthorize("isAuthenticated()")
    public String modify(String id, Model model) {



        return null;
    }
}
