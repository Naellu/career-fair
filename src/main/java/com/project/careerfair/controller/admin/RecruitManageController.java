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
@RequestMapping("/admin/recruiter/")
public class RecruitManageController {

    private final RecruitManageService rmservice;

    @GetMapping("recruitmanage")
    public String recruitForm (Model model
                              , @RequestParam(value = "page", defaultValue = "1") Integer page
                              , @RequestParam(value = "search", required = false, defaultValue = "")String search
                              , @RequestParam(value="type", required = false)String type
                              , @RequestParam(value = "status", required = false) String status){
        Map<String, Object> list = rmservice.getPosting(page, search, type, status);

        model.addAllAttributes(list);

        return "admin/recruiter/recruitmanage";
    }
    @PostMapping("remove")
    public void removeForm(Integer id, RedirectAttributes rttr) {
        boolean ok = rmservice.removeProcess(id);

        if(ok) {
            rttr.addFlashAttribute("message", "해당 공고 삭제가 완료됐습니다.");
        }else {
            rttr.addFlashAttribute("message","공고 삭제에 문제가 발생하였습니다.");
        }
    }

}
