package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.members.MailService;
import com.project.careerfair.service.members.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/members/")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    private final MailService mailService;

    @GetMapping("signup")
    public void signUpForm() {

    }

    @PostMapping("signup")
    public String signUpProcess(Members member, RedirectAttributes rttr) {
        try {
            memberService.signup(member);
            rttr.addFlashAttribute("", "회원가입이 완료되었습니다.");
            System.out.println("회원가입이 완료되었습니다.");
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("members", member);
            System.out.println("회원가입에 실패하였습니다.");
            return "redirect:/members/signup";
        }
    }

    @GetMapping("cosignup")
    public void comSignUpForm() {

    }
    @PostMapping("cosignup")
    public String comSignUpProcess(Members member, RedirectAttributes rttr) {
        System.out.println(member);
        try {
            memberService.signup(member);
            rttr.addFlashAttribute("", "회원가입이 완료되었습니다.");
            System.out.println("회원가입이 완료되었습니다.");
            return "redirect:/login";
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("members", member);
            System.out.println("회원가입에 실패하였습니다.");
            return "redirect:/members/cosignup";
        }
    }

    //id 유효성 검사
    @GetMapping("checkId/{member_id}")
    @ResponseBody
    public Map<String, Object> checkId(@PathVariable("member_id") String id) {

        return memberService.checkId(id);
    }

    //메일 인증
    @PostMapping("mail")
    public void mailSend(String email, HttpSession session) {

        mailService.sendMail(email, session);

    }

    @PostMapping("mailCheck")
    @ResponseBody
    public Map<String, Object> mailCheck(Model model, Integer enteredCode, HttpSession session) {

        Boolean ok = mailService.compareNum(enteredCode, session);

        model.addAttribute("authentication", ok);
        return Map.of("authentication", ok);

    }

    @PostMapping("searchMail")
    @ResponseBody
    public Map<String, Object> checkMailId(@RequestParam("email") String email, Authentication authentication) {

        return memberService.checkMailId(email, authentication);
    }

    //약관 동의서
    @GetMapping("agree")
    public void agreeView (){

    }

    //휴대폰 중복
    @GetMapping("checkphoneNumber/{phoneNumber}")
    @ResponseBody
    public Map<String, Object> checkPhoneNum(@PathVariable("phoneNumber") String phoneNumber, Authentication authentication) {

        return memberService.checkPhoneNum(phoneNumber, authentication);
    }

    //id찾기
    @GetMapping("useridfind")
    public void findId() {

    }

    @PostMapping("findId")
    @ResponseBody
    public String find_id(String email, String name, Model model) {

        String result = memberService.findId(email, name);
        model.addAttribute("id", result);

        return result;
    }

    //비번찾기
    @GetMapping("sendPw")
    public void sendPw(){

    }

    @PostMapping("sendPw")
    public ResponseEntity<Map<String, Object>> sendUserPw (String id, String email, HttpSession session){

        String memberId = memberService.checkUser(id, email);
        boolean shouldSendEmail = (memberId != null);

        Map<String, Object> response = new HashMap<>();
        response.put("success" , shouldSendEmail);
        if(shouldSendEmail) {
            boolean result = mailService.createPw(id,email,session);
            response.put("message", "입력하신 메일로 임시 비밀번호가 발송되었습니다!!");
            return ResponseEntity.ok(response);
        }else {
            response.put("message","회원정보가 일치하지 않습니다!!");
            return ResponseEntity.status(404).body(response);
        }

    }
}
