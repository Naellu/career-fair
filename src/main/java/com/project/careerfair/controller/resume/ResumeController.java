package com.project.careerfair.controller.resume;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Resume;
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
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/resume/")
public class ResumeController {

    private final IndustryService industryService;
    private final ResumeService resumeService;

    // 이력서 목록 가져오기
    @GetMapping
    public String resumeList(Model model, Authentication authentication) {
        String memberId = authentication.getName();
        List<Resume> resumeList = resumeService.findByMemberId(memberId);
        // view에 데이터 전달
        model.addAttribute("resumeList", resumeList);
        return "resume/list";
    }

    // 이력서 상세 데이터 가져오기
    @GetMapping("{resumeId}")
    public String showDetail(@PathVariable Integer resumeId, Model model, Authentication authentication) {
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        // view에 상세 데이터 전달
//      resumeId랑 memberId로 인적사항 정보 가져오기
        Members memberInfo = resumeService.getMemberInfoByMemberId(resumeDetailData.getResumeId(), resumeDetailData.getMemberId());
        model.addAttribute("resumeData", resumeDetailData);
        model.addAttribute("memberId", authentication.getName());
        model.addAttribute("memberInfo", memberInfo);
        return "resume/detail";
    }

    @GetMapping("write")
    public String showOnlineResume(Model model, Authentication authentication) {
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("industry", industryList);
        return "resume/write";
    }

    @PostMapping("write")
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
    @GetMapping("{resumeId}/update")
    public String showUpdateOnlineResume(@PathVariable Integer resumeId, Model model, Authentication authentication) {
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("resumeUpdateData", resumeDetailData);
        model.addAttribute("industry", industryList);
        return "resume/update";
    }

    @PutMapping("{resumeId}")
    public ResponseEntity<String> updateResume(@RequestBody ResumeDto resumeDto,
                                               @PathVariable Integer resumeId,
                                               Authentication authentication) {
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

    @DeleteMapping("{resumeId}")
    public ResponseEntity<String> deleteOnlineResume(@PathVariable Integer resumeId, Authentication authentication) {

        String memberId = authentication.getName();

        if (resumeService.checkResumeByMemberId(memberId, resumeId) == 1) {
            Integer checkDeleteStatus = resumeService.deleteResume(resumeId);
            return ResponseEntity.ok("이력서를 정상적으로 삭제하였습니다");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("비정상적인 삭제 요청입니다");
        }
    }

    @GetMapping("scout")
    public String scoutList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                            @RequestParam(value = "industry", required = false) Integer[] industries,
                            Model model) {
        Map<String, Object> resumeOfIndustryAndPage = resumeService.findAllByIndustry(page, industries);
        List<Industry> industryList = industryService.getIndustryList();

        model.addAttribute("industryList", industryList);
        model.addAllAttributes(resumeOfIndustryAndPage);
        return "resume/scout";
    }

}
