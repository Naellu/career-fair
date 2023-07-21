package com.project.careerfair.service.members;

import com.project.careerfair.domain.ExhibitionInfo.ExhibitionInfo;
import com.project.careerfair.mapper.members.MemberMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.*;
import org.springframework.mail.javamail.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Random;

@Slf4j
@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService {
    private final JavaMailSender javaMailSender;

    private final PasswordEncoder passwordEncoder;

    private final MemberMapper memberMapper;

    private final ExhibitionInfoService exhibitionInfoService;

    @Override
    public void sendMail(String email, HttpSession session) {
        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
        ArrayList<String> toUser = new ArrayList<>();

        String title = exhibitionInfo.getTitle();

        toUser.add(email);

        int toUserSize = toUser.size();

        SimpleMailMessage simpleMessage = new SimpleMailMessage();

        simpleMessage.setTo((String[]) toUser.toArray(new String[toUserSize]));

        Random random = new Random();
        int randomNum = random.nextInt(900000) + 100000;

        log.info("randomNum: {}", randomNum);

        simpleMessage.setSubject(title + " 회원 인증메일입니다.");
        simpleMessage.setText("안녕하세요! " + title + "입니다!\n" + "본인 확인 인증 번호를 보내드립니다.\n" + "\n" + "인증 번호 : " + randomNum + "\n"
                + "\n 타인에게 노출 시 계정 도용의 위험이 있습니다.");
        javaMailSender.send(simpleMessage);


        session.setMaxInactiveInterval(60 * 3);
        session.setAttribute("authenticatedNum", randomNum);
    }

    @Override
    public boolean compareNum(Integer enteredCode, HttpSession session) {

        Object num = session.getAttribute("authenticatedNum");
        if (enteredCode.equals(num)) {

            System.out.println("enteredCode ture=>" + enteredCode);
            return true;
        } else {

            System.out.println("enteredCode false=>" + enteredCode);
            return false;
        }
    }

    @Override
    public boolean createPw(String id, String email, HttpSession session) {
        ArrayList<String> toUserList = new ArrayList<>();

        ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();

        String title = exhibitionInfo.getTitle();

        String ok = memberMapper.checkUser(id, email);

        int cnt = 0;
        toUserList.add(email);

        int toUserSize = toUserList.size();

        SimpleMailMessage simpleMessage = new SimpleMailMessage();

        simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

        Random random = new Random();
        int randomNumber = random.nextInt(900000) + 100000;
        String validity = String.valueOf(randomNumber);

        String password = passwordEncoder.encode(validity);

        cnt = memberMapper.updatePw(id, email, password);

        session.setAttribute("authenticatedNum", password);
        simpleMessage.setSubject(title + " 인증메일입니다.");
        simpleMessage.setText("안녕하세요." + title + "입니다 임시 비밀번호를 보내드립니다.\n" + "\n" + "임시 비밀번호\n" + "++++++++++\n"
                + randomNumber + "\n++++++++++");

        javaMailSender.send(simpleMessage);
        return cnt == 1;
    }
}
