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

import java.util.HashMap;
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
                              , @RequestParam(value = "round", defaultValue = "all") String roundValue){
        Map<String, Object> list = rmservice.getPosting(page, search, type, roundValue);

        model.addAllAttributes(list);

        return "admin/management/recruitmanagement";
    }

    @PostMapping("/recruitend")
    public ResponseEntity<Map<String ,Object>> jobEnd(Integer postingId) {
        boolean ok = rmservice.jobEndForm(postingId);

        Map<String, Object> result = new HashMap<>();

        if(ok) {
            result.put("message","success");
            return ResponseEntity.ok(result);
        }else {
            result.put("message","fail");
            return ResponseEntity.status(404).body(result);
        }
    }

    @PostMapping("remove")
    public ResponseEntity<Map<String,Object>> removeForm(Integer postingId) {
        boolean ok = rmservice.removeProcess(postingId);
//        boolean ok = true;
        Map<String, Object> result = new HashMap<>();
        if(ok) {
            result.put("message","success");
            return ResponseEntity.ok(result);
        }else {
            result.put("message","fail");
            return ResponseEntity.status(404).body(result);
        }
    }

}
