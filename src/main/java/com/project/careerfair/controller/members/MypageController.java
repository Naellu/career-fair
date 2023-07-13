package com.project.careerfair.controller.members;

import com.project.careerfair.domain.*;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.service.industry.IndustryService;
import com.project.careerfair.service.resume.ResumeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String resumeList(Model model) {
        // 이력서 데이터 가져오기
        String memberId = "testUser12345";
        List<Resume> resumeList = resumeService.findByMemberId(memberId);
        // view에 데이터 전달
        model.addAttribute("resumeList", resumeList);
        return "member/resume/list";
    }

    @GetMapping("resume/{resumeId}")
    public String showDetail(@PathVariable Integer resumeId, Model model) {
        // 이력서 상세 데이터 가져오기
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        log.info("resumeDetailData IN CONTROLLER = {}", resumeDetailData);
        // view에 상세 데이터 전달
        model.addAttribute("resumeData", resumeDetailData);
        log.info("model IN CONTROLLER = {}", model);
        return "member/resume/detail";
    }

    @GetMapping("resume/write")
    public String showOnlineResume(Model model, Authentication authentication) {
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("industry", industryList);
        return "member/resume/write";
    }

    @PostMapping("resume/write")
    public ResponseEntity<String> writeOnlineResume(@RequestBody ResumeDto resumeDto, Authentication authentication) {
        try {
            Integer resumeId = resumeService.insertResumeData(resumeDto, authentication);
            return ResponseEntity.ok("성공적으로 등록되었습니다");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("데이터 입력 중 오류가 발생했습니다");
        }
    }
}
