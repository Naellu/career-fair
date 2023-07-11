package com.project.careerfair.controller.posting;

import com.project.careerfair.domain.Posting;
import com.project.careerfair.service.posting.PostingServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/member/company/posting")
@RequiredArgsConstructor
public class CompanyPostingController {

    private final PostingServiceImpl service;

    @GetMapping("list")
    public void list(
            String memberId,
            Model model,
            @RequestParam(value="page", defaultValue = "1")Integer page
    ){

        Map<String,Object> resultMap = service.getPostingInfo(memberId, page);
        model.addAttribute("postingList", resultMap.get("postingList"));
        model.addAttribute("pageInfo", resultMap.get("pageInfo"));
    }

    @GetMapping("add")
    public void addForm(
            String userId,
            Model model
    ){
        Map<String, Object> result = service.getCompanyInfo(userId);
        model.addAttribute("companyList",result.get("companyList"));
        model.addAttribute("industryList", result.get("industryList"));
    }

    @PostMapping("add")
    public String addProcess(
            Posting posting

    ) {
        return "redirect:/member/company/posting/list?memberId=" + posting.getMemberId();
    }
}
