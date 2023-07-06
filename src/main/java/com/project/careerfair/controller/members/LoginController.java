package com.project.careerfair.controller.members;

import com.project.careerfair.jwt.JwtToken;
import com.project.careerfair.service.members.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class LoginController {

    private final MemberService service;

    @PostMapping("login")
    public ResponseEntity<JwtToken> loginSuccess(@RequestBody Map<String, String> loginForm) {
        JwtToken token = service.login(loginForm.get("username"), loginForm.get("password"));
        return ResponseEntity.ok(token);
    }


}
