package com.project.careerfair.service.members;

import jakarta.servlet.http.HttpSession;

public interface MailService {
    public void sendMail(String email, HttpSession session);

    public boolean compareNum(Integer enteredCode, HttpSession session);

    public boolean createPw(String id, String email, HttpSession session);
}
