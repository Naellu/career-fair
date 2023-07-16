package com.project.careerfair.controller.admin;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adminMainController")
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('admin')")
public class MainController {

    @GetMapping("/main")
    public String main() {
        return "admin/main";
    }
}

