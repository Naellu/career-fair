package com.project.careerfair.controller.admin;

import com.project.careerfair.service.admin.RecruiterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller("adminRecruiterControllerAPI")
@Slf4j
@RequestMapping("/api/admin/recruiter/")
@RequiredArgsConstructor
public class RecruiterControllerAPI {

    private final RecruiterService recruiterService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getList(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        Map<String, Object> result = recruiterService.getList(search, type, page, status);
        return ResponseEntity.ok(result);
    }


}
