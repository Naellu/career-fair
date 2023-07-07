package com.project.careerfair.controller;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequestMapping("members")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @GetMapping("signup")
    public void signUpForm() {

    }

    @PostMapping("signup")
    public String signUpProcess(Members member, RedirectAttributes rttr) {
        System.out.println(member);
        try {
            memberService.signup(member);
            rttr.addFlashAttribute("", "회원가입이 완료되었습니다.");
            System.out.println("회원가입이 완료되었습니다.");
            return "redirect:/members/login";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("members", member);
            System.out.println("회원가입에 실패하였습니다.");
            return "redirect:/members/signup";
        }
    }

    //id 유효성 검사
    @GetMapping("checkId/{member_id}")
    @ResponseBody
    public Map<String, Object> checkId(@PathVariable("member_id") String id) {

        return memberService.checkId(id);
    }
}
