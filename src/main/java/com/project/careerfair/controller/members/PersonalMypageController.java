package com.project.careerfair.controller.members;

import com.project.careerfair.service.apply.PostingApplyService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members/personal-page/")
public class PersonalMypageController {
    // 개인회원 마이페이지

    private final PostingApplyService postingApplyService;
    @GetMapping("apply/list")
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

    @GetMapping("apply/detail")
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
        @GetMapping("apply/modify")
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
    @PostMapping("apply/cancel")
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
