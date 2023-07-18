package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Resume;
import com.project.careerfair.domain.dto.ResumeDto;
import com.project.careerfair.service.apply.PostingApplyService;
import com.project.careerfair.service.industry.IndustryService;
import com.project.careerfair.service.posting.PostingService;
import com.project.careerfair.service.resume.ResumeService;
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
    private final PostingService postingService;

    @GetMapping("company/mypage")
    public String myPage() {

        return "member/company/mypage";
    }

    // 이력서 목록 가져오기
    @GetMapping("resume")
    public String resumeList(Model model, Authentication authentication) {
        String memberId = authentication.getName();
        List<Resume> resumeList = resumeService.findByMemberId(memberId);
        // view에 데이터 전달
        model.addAttribute("resumeList", resumeList);
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
    public String showUpdateOnlineResume(@PathVariable Integer resumeId, Model model, Authentication authentication) {
        ResumeDto resumeDetailData = resumeService.getResumeById(resumeId);
        List<Industry> industryList = industryService.getIndustryList();
        model.addAttribute("resumeUpdateData", resumeDetailData);
        model.addAttribute("industry", industryList);
        return "member/resume/update";
    }

    @PutMapping("resume/{resumeId}")
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

    @DeleteMapping("resume/{resumeId}")
    public ResponseEntity<String> deleteOnlineResume(@PathVariable Integer resumeId, Authentication authentication) {

        String memberId = authentication.getName();

        if (resumeService.checkResumeByMemberId(memberId, resumeId) == 1) {
            Integer checkDeleteStatus = resumeService.deleteResume(resumeId);
            return ResponseEntity.ok("이력서를 정상적으로 삭제하였습니다");
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("비정상적인 삭제 요청입니다");
        }
    }

    @GetMapping("resume/scout")
    public String scoutList(@RequestParam(value = "page", defaultValue = "1") Integer page,
                            @RequestParam(value = "industry", required = false) Integer[] industries,
                            Model model) {
        Map<String, Object> resumeOfIndustryAndPage = resumeService.findAllByIndustry(page, industries);
        List<Industry> industryList = industryService.getIndustryList();

        model.addAttribute("industryList", industryList);
        model.addAllAttributes(resumeOfIndustryAndPage);
        return "member/resume/scout";
    }

    @GetMapping("user/apply/list")
    public void applyList(
            Authentication authentication,
            Model model
    ) {
        String memberId = authentication.getName();
        Map<String, Object> resultMap = postingApplyService.getApplyList(memberId);

        model.addAttribute("applyList", resultMap.get("applyList"));
        model.addAttribute("post", resultMap.get("post"));
    }

    @GetMapping("user/apply/detail")
    public void applyDetail(
            Integer applicationId,
            Model model
    ) {
        Map<String, Object> result = postingApplyService.getApplyInfo(applicationId);

        model.addAttribute("application", result.get("application"));
        model.addAttribute("posting", result.get("posting"));
        model.addAttribute("fileNames", result.get("fileNames"));
    }

    /*
        @GetMapping("user/apply/modify")
        public void applyModify(
                Integer applicationId,
                Model model
        ){
            Map<String,Object> result = postingApplyService.getApplyInfo(applicationId);
            model.addAllAttributes(result);

        }

        @PostMapping("user/apply/modify")
        public String applyModifyProcess(
                MultipartFile[] addFiles,
                @RequestParam("removeFiles") List<String> removeFiles,
                JobApplication application,
                RedirectAttributes rttr
        ) {


            return "redirect:/member/user/apply/detail?applicationId="+ application.getApplicationId();
        }
        */
    @PostMapping("user/apply/cancel")
    public void applyCancel(
            HttpServletResponse response,
            Integer applicationId
    ) {
        Boolean ok = postingApplyService.applyCancel(applicationId);

        if(ok) {

            // 클라이언트에게 닫기 요청을 보냄
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.println("<script>alert('지원이 취소되었습니다.');window.close();</script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
            try {
                out = response.getWriter();
                out.println("<script>alert('다시 시도해주세요');window.close();</script>");
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}

