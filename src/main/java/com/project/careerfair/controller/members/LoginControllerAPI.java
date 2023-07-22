package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.members.MailService;
import com.project.careerfair.service.members.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/login/locked")
public class LoginControllerAPI {

    private final MemberService memberService;

    private final MailService mailService;

    // 이메일 있는지 확인
    @GetMapping
    public ResponseEntity<Map<String, Object>> emailCheck(
            @RequestParam String memberId) {

        Map<String, Object> result = memberService.checkEmail(memberId);
        return ResponseEntity.ok(result);
    }

    // 이메일 보내기
    @PostMapping("/send-email")
    public ResponseEntity<Map<String, Object>> sendEamil(
            @RequestBody Members member,
            HttpSession session) {
        String email = member.getEmail();
        Map<String, Object> result = new HashMap<>();
        try {
            mailService.sendMail(email, session);
            result.put("message", "success");
        } catch (Exception e) {
            result.put("message", "fail");
        }
        return ResponseEntity.ok(result);
    }

    @PostMapping("/verification")
    public ResponseEntity<Map<String, Object>> emailVerification(
            @RequestBody Map<String, Object> map,
            HttpSession session) {

        Map<String, Object> result = memberService.active(map, session);
        return ResponseEntity.ok(result);
    }
}
