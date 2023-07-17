package com.project.careerfair.controller.posting;

import com.project.careerfair.domain.JobApplication;
import com.project.careerfair.service.posting.UserPostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@RestController
@RequestMapping("/api/user/posting/")
@RequiredArgsConstructor
@Slf4j
public class UserPostingControllerAPI {

    private final UserPostingService userPostingService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getPostings(
            @RequestParam(value = "industrIds", required = false) Integer[] industrIds,
            @RequestParam(value = "experienceLevels", required = false) String[] experienceLevels,
            @RequestParam(value = "educationLevels", required = false) String[] educationLevels,
            @RequestParam(value = "employmentTypes", required = false) String[] employmentTypes,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "search", defaultValue = "") String search,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {

        Map<String, Object> result = userPostingService.getPostings(industrIds, experienceLevels, educationLevels, employmentTypes, type, search, page);
        return ResponseEntity.ok(result);
    }

    @GetMapping("{postingId}")
    public ResponseEntity<Map<String, Object>> getDetail(@PathVariable Integer postingId, Authentication authentication) {

        Map<String, Object> result = userPostingService.getDetail(postingId, authentication);

        return ResponseEntity.ok(result);
    }

    // 지원하기전 날짜, 지원자수, 로그인 상황체크
    @GetMapping("application/{postingId}")
    public ResponseEntity<Map<String, Object>> application(@PathVariable Integer postingId, Authentication authentication) {

        if (authentication == null) {
            return ResponseEntity
                    .status(403)
                    .build();
        } else {
            Map<String, Object> result = userPostingService.beforeApplyCheck(postingId, authentication);
            return ResponseEntity.ok(result);
        }
    }

    @PostMapping("application")
    public ResponseEntity<Map<String, Object>> apply(
            JobApplication jobApplication,
            @RequestParam(value = "files", required = false) MultipartFile[] files
            , Authentication authentication) {

        Map<String, Object> result = null;
        try {
            result = userPostingService.apply(jobApplication, files, authentication);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(result);
    }
}
