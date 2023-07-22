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
                              , @RequestParam(value = "search", required = false, defaultValue = "")String search
                              , @RequestParam(value="type", required = false)String type){
        Map<String, Object> list = rmservice.getPosting(page, search, type);

        model.addAllAttributes(list);

        return "admin/management/recruitmanagement";
    }
    @PostMapping("remove")
    public void removeForm(Integer appicaitonId,Integer postingId, RedirectAttributes rttr) {
        boolean ok = rmservice.removeProcess(appicaitonId,postingId);

        if(ok) {
            rttr.addFlashAttribute("message", "해당 공고 삭제가 완료됐습니다.");
        }else {
            rttr.addFlashAttribute("message","공고 삭제에 문제가 발생하였습니다.");
        }
    }

}
