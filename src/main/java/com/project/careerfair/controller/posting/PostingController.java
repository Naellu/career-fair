package com.project.careerfair.controller.posting;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Posting;
import com.project.careerfair.service.posting.PostingService;
import com.project.careerfair.service.posting.PostingServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/posting")
@RequiredArgsConstructor
public class PostingController {

    private final PostingServiceImpl service;

    @GetMapping("list")
    public void list(){

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
    public void addProcess(
            Posting posting
    ) {
        for (java.lang.reflect.Field field : posting.getClass().getDeclaredFields()) {
            field.setAccessible(true);
            try {
                String fieldName = field.getName();
                Object fieldValue = field.get(posting);
                System.out.println(fieldName + ": " + fieldValue);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
    }
}
