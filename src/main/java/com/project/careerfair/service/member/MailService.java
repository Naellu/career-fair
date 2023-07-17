package com.project.careerfair.service.member;

import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import java.util.Map;

public interface MailService {
    public void sendMail(String email, HttpSession session);

    public boolean compareNum(Integer enteredCode, HttpSession session);

    public boolean createPw(String id, String email, HttpSession session);
}
