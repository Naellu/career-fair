/* package com.project.careerfair.service;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.Service;
import org.springframework.security.crypto.password.*;

import java.util.ArrayList;
import java.util.Random;

@Service
public class MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void sendMail(String email, HttpSession session) {

        ArrayList<String> toUser = new ArrayList<>();

        toUser.add(email);

        int toUserSize = toUser.size();

        SimpleMailMessage simpleMessage = new SimpleMailMessage();

        simpleMessage.setTo((String[]) toUser.toArray(new String[toUserSize]));

        Random random = new Random();
        int randomNum = random.nextInt(900000) + 100000;

        simpleMessage.setSubject("xx박람회 회원 인증메일입니다.");
        simpleMessage.setText("안녕하세요! xx박람회 입니다!\n" + "본인 확인 인증 번호를 보내드립니다.\n" + "\n" + "인증 번호 : " + randomNum +"\n"
                + "\n 타인에게 노출 시 계정 도용의 위험이 있습니다.");

        javaMailSender.send(simpleMessage);

        session.setAttribute("authenticationNum",randomNum);
    }



}
추후 회원가입창 완료 되면 다시 */