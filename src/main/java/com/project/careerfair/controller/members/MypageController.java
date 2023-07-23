package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Resume;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.service.apply.PostingApplyService;
import com.project.careerfair.service.industry.IndustryService;
import com.project.careerfair.service.resume.ResumeService;
import com.project.careerfair.service.scrap.ScrapService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member/")
public class MypageController {

    private final IndustryService industryService;
    private final ResumeService resumeService;
    private final PostingApplyService postingApplyService;
//  private final PostingService postingService;
    private final ScrapService scrapService;

    @GetMapping("company/mypage")
    public String myPage() {

        return "member/company/mypage";
    }

//  모든 이력서 메서드 이동




}

