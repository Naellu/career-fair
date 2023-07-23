package com.project.careerfair.controller.members;

import com.project.careerfair.domain.Members;
import com.project.careerfair.service.generalmember.UserPageService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;

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

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
@RequiredArgsConstructor
@PreAuthorize("isAuthenticated() and hasAuthority('user')")
@RequestMapping("/members/personal-page/")
public class PersonalMypageController {
    private final PostingApplyService postingApplyService;
    private final UserPageService userService;

    @GetMapping("mypage")
    @PreAuthorize("hasAuthority('admin') or (isAuthenticated() and (authentication.name eq #id))")
    public void myPage(String id, Model model) {

        Members member = userService.get(id);
        model.addAttribute("members", member);

        Integer unreadNoteCount = userService.getUnreadNoteCount(id);
        model.addAttribute("unreadNote", unreadNoteCount);
    }

    @GetMapping("myinfo")
    @PreAuthorize("hasAuthority('admin') or (isAuthenticated() and (authentication.name eq #id))")
    public void myInfo(String id, Model model) {

        Members members = userService.get(id);

        model.addAttribute("members", members);
    }

    @GetMapping("modify")
    @PreAuthorize("hasAuthority('admin') or (isAuthenticated() and (authentication.name eq #id))")
    public void modifyForm(String id , Model model) {
        Members member = userService.get(id);
        model.addAttribute("member",member);
    }

    @PostMapping("modify")
    @PreAuthorize("isAuthenticated()")
    public String modify(Members member, RedirectAttributes rttr, String oldPassword) {
        boolean ok = userService.modifyAccount(member, oldPassword);
        if(ok) {
            rttr.addFlashAttribute("message", "회원 정보가 수정되었습니다.");
            return "redirect:/members/personal-page/myinfo?id=" + member.getId();
        }else {
            rttr.addFlashAttribute("message", "회원 정보 수정중 오류가 발생하였습니다.");
            return "redirect:/members/personal-page/modify?id=" + member.getId();
        }

    }
    @PostMapping("remove")
    public String idRemove(Members member, RedirectAttributes rttr, HttpServletRequest request) throws ServletException {

        boolean ok = userService.removeAccout(member);
        if(ok) {
            rttr.addFlashAttribute("message", "회원 탈퇴가 완료되었습니다.");

            //로그아웃
            request.logout();
            return "redirect:/login";
        }else {
            rttr.addFlashAttribute("message","회원 탈퇴 중 문제가 발생하였습니다.");
            return "redirect:/members/personal-page/myInfo?id=" + member.getId();

 
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
