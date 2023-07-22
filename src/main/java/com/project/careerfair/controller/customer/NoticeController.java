package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.service.customer.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer/notice/")
@RequiredArgsConstructor
@Slf4j
public class NoticeController {

    @GetMapping("list")
    public String list() {
        return "customer/notice/list";
    }

    @GetMapping("reg")
    @PreAuthorize("hasAuthority('admin')")
    public String reg() {
        return "customer/notice/reg";
    }

    @GetMapping("{noticeId}")
    public String detail(@PathVariable("noticeId") Integer noticeId) {
        return "customer/notice/detail";
    }

    @GetMapping("modify/{noticeId}")
    @PreAuthorize("hasAuthority('admin')")
    public String modify(@PathVariable("noticeId") Integer noticeId) {
        return "customer/notice/modify";
    }
}
