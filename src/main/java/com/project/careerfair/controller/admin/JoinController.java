package com.project.careerfair.controller.admin;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminJoinController")
@Slf4j
@RequestMapping("/admin/join/")
@PreAuthorize("hasAuthority('admin')")
public class JoinController {

    @GetMapping("list")
    public String list() {
        return "admin/join/list";
    }

    @GetMapping("{companyId}")
    public String detail(@PathVariable("companyId") Integer companyId) {
        return "admin/join/detail";
    }
}
