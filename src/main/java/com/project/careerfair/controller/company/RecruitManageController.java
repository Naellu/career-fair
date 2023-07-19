package com.project.careerfair.controller.company;

import com.project.careerfair.domain.Members;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.service.company.RecruitManageService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/company/manage")
public class RecruitManageController {

    private final RecruitManageService rmservice;

    @GetMapping("recruitmanage")
    @PreAuthorize("hasAuthority('company') or (isAuthenticated() and (authentication.name eq #id))")
    public void recruitForm(Model model, String id){
        Members list = rmservice.getRecruterId(id);
        Posting posting = rmservice.getPosting(id);
        model.addAttribute("recruitList",list);
        model.addAttribute("postingList",posting);

    }
//    @PostMapping("recruitmanage")
//    public String recruitList(Model model, String memberId){
//        List<Posting> list = rmservice.getRecrutList(memberId);
//
//        return "/member/company/manage/recruitmanage";
//    }

}
