package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("member")
public class UserMyPageController {

    private final MemberService service;

    @GetMapping("user/mypage")
    public String myPage() {
        return "member/user/mypage";
    }

    @GetMapping("user/myInfo/{id}")
    public void myInfo(@PathVariable("id") String id, Model model) {

        Members members = service.get(id);
        System.out.println(members.getName());

        model.addAttribute("members", members);
    }
}
