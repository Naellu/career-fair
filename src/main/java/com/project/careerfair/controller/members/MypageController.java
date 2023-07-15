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

    // 이력서 목록 가져오기
    @GetMapping("resume")
    public String resumeList(Model model, Authentication authentication) {
//        String memberId = "testUser12345";
        String memberId = authentication.getName();
        log.info("memberId IN CONTROLLER={}",memberId);
        List<Resume> resumeList = resumeService.findByMemberId(memberId);
        // view에 데이터 전달
        model.addAttribute("resumeList", resumeList);
        log.info("model IN CONTROLLER={}",model);
        return "member/resume/list";
    }

    // 이력서 상세 데이터 가져오기
    @GetMapping("resume/{resumeId}")
    public String showDetail(@PathVariable Integer resumeId, Model model, Authentication authentication) {
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        // view에 상세 데이터 전달
        model.addAttribute("resumeData", resumeDetailData);
        model.addAttribute("memberId", authentication.getName());
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
            Integer resumeId = resumeService.insertResumeData(resumeDto, authentication.getName());
            return ResponseEntity.ok("성공적으로 등록되었습니다");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("데이터 입력 중 오류가 발생했습니다");
        }
    }

    // 이력서 수정 데이터 가져오기
    @GetMapping("resume/{resumeId}/update")
    public String update(@PathVariable Integer resumeId, Model model, Authentication authentication) {
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("resumeUpdateData", resumeDetailData);
        model.addAttribute("industry", industryList);
        return "member/resume/update";
    }

    @PutMapping("resume/{resumeId}/update")
    public ResponseEntity<String> update(@RequestBody ResumeDto resumeDto,
                                         @PathVariable Integer resumeId,
                                         Authentication authentication) {
//        String memberId = "testUser12345";
        String memberId = authentication.getName();

        // resumeId를 memberId가 가지고 있는게 맞는지 확인
        if (resumeService.checkResumeByMemberId(memberId, resumeId) == 1) {
            resumeDto.setMemberId(memberId);
            // 맞으면 서비스로 resumeDto 전달
            resumeService.updateResumeData(resumeDto);
            return ResponseEntity.ok("이력서 수정이 완료되었습니다");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("이력서 정보가 없습니다");
        }

    }
}
