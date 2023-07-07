package com.project.careerfair.controller.recruiter;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.service.recruiter.RecruiterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("companyRecruiterControllerAPI ")
@Slf4j
@RequestMapping("/api/recruiter/")
@RequiredArgsConstructor
public class RecruiterControllerAPI {

    @Value("${current.event}")
    String round;

    private final RecruiterService recruiterService;

    @GetMapping
    public List<Industry> industryList() {
        return recruiterService.getIndustryList();
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> reg(
            Company company,
            @RequestParam("files") MultipartFile[] files) {
        boolean ok = false;
        try {
            ok = recruiterService.create(company, files);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Map<String, Object> response = new HashMap<>();

        if (ok) {
            // 성공 시 적절한 응답 반환
            return ResponseEntity.ok(response);
        } else {
            // 실패 시 적절한 응답 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}
