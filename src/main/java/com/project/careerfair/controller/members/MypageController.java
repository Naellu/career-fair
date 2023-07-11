package com.project.careerfair.controller.members;

import com.project.careerfair.domain.*;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.service.industry.IndustryService;
import com.project.careerfair.service.resume.ResumeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Stream;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member/")
public class MypageController {

    private final IndustryService industryService;
    private final ResumeService resumeService;

    @GetMapping("company/mypage")
    public String myPage() {

        return "member/company/mypage";
    }

    @GetMapping("resume")
    public String resumeList() {
        return "member/resume/list";
    }

    @GetMapping("resume/write")
    public String showOnlineResume(Model model) {
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("industry", industryList);
        return "member/resume/write";
    }

    @PostMapping("resume/write")
    public void writeOnlineResume(@RequestBody ResumeDto resumeDto,
                                  Authentication authentication) {

        log.info("ResumeId IN CONTROLLER={}",resumeDto.getResumeId());

        for (Career career : resumeDto.getCareers()) {
            log.info("Career IN CONTROLLER={}",career);
        }

        for (Education education : resumeDto.getEducations()) {
            log.info("Education IN CONTROLLER={}",education);
        }

        for (Certification certification : resumeDto.getCertifications()) {
            log.info("certification IN CONTROLLER={}",certification);
        }

        for (WorkArea workArea : resumeDto.getWorkAreas()) {
            log.info("workArea IN CONTROLLER={}",workArea);
        }

        log.info("workCondition IN CONTROLLER={}", resumeDto.getWorkCondition());
        log.info("title IN CONTROLLER={}",resumeDto.getTitle());
        log.info("military IN CONTROLLER={}",resumeDto.getMilitary());
        log.info("intro IN CONTROLLER={}",resumeDto.getIntro());
        log.info("industryId IN CONTROLLER={}",resumeDto.getIndustryId());

        resumeService.insertResumeData(resumeDto, authentication);
    }
}
