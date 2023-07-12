package com.project.careerfair.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminRecruiterController")
@Slf4j
@RequestMapping("/admin/recruiter/")
@PreAuthorize("hasAuthority('admin')")
public class RecruiterController {

    @GetMapping("list")
    public String list() {
        return "admin/recruiter/list";
    }

    @GetMapping("{companyId}")
    public String detail(@PathVariable("companyId") Integer companyId) {
        return "admin/recruiter/detail";
    }
}
