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

    @GetMapping("user/apply/list")
    public void applyList(
            Authentication authentication,
            Model model
    ) {
        String memberId = authentication.getName();
        Map<String, Object> resultMap = postingApplyService.getApplyList(memberId);

        model.addAttribute("applyList", resultMap.get("applyList"));
        model.addAttribute("post", resultMap.get("post"));
        model.addAttribute("company", resultMap.get("companyList"));
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

    @GetMapping("/user/scrap/list")
    public void getScrapList(
            Authentication authentication,
            Model model
    ){
        String memberId = authentication.getName();

        Map<String, Object> result = new HashMap<>();
        result = scrapService.getScrapList(memberId);

        model.addAllAttributes(result);

    }

    @PostMapping("/user/scrap/cancel")
    public void cancelScrap(
            Integer scrapId,
            HttpServletResponse response

    ){
        boolean ok = scrapService.cancelScrap(scrapId);


        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out;
        try {
            out = response.getWriter();
            if(ok) {
                out.println("<script>alert('스크랩이 취소되었습니다');");
            } else{
                out.println("<script>alert('다시 시도해주세요');");
            }
            out.println("window.location.href='/member/user/scrap/list';</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

