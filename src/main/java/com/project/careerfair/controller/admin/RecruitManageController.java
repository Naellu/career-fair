package com.project.careerfair.controller.admin;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.service.admin.RecruitManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('admin')")
@RequiredArgsConstructor
@RequestMapping("/admin/management/")
public class RecruitManageController {

    private final RecruitManageService rmservice;

    @GetMapping("recruitmanagement")
    public String recruitForm (Model model
                              , @RequestParam(value = "page", defaultValue = "1") Integer page
                              , @RequestParam(value = "search", defaultValue = "")String search
                              , @RequestParam(value="type", required = false)String type
                              , @RequestParam(value = "round", required = false) Integer round){
        Map<String, Object> list = rmservice.getPosting(page, search, type, round);

        model.addAllAttributes(list);

        return "admin/management/recruitmanagement";
    }

//    @PostMapping("/recruitmanagement/recruitend")
//    public String jobEnd(Posting posting, String memberId ,RedirectAttributes rttr, Model model) {
//        boolean ok = rmservice.jobEndForm(posting,memberId);
//
//        if(ok){
//            rttr.addFlashAttribute("message","마감되었습니다.");
//            return "redirect:./";
//        }else {
//            rttr.addFlashAttribute("message","오류가 발생하였습니다.");
//            return "redirect:./";
//        }
//    }
//    @PostMapping("remove")
//    public void removeForm(Integer appicaitonId,Integer postingId, RedirectAttributes rttr) {
//        boolean ok = rmservice.removeProcess(appicaitonId,postingId);
//
//        if(ok) {
//            rttr.addFlashAttribute("message", "해당 공고 삭제가 완료됐습니다.");
//            System.out.println(postingId);
//        }else {
//            rttr.addFlashAttribute("message","공고 삭제에 문제가 발생하였습니다.");
//            System.out.println(postingId);
//        }
//    }

}
