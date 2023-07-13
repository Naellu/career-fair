package com.project.careerfair.controller.posting;

import com.project.careerfair.service.posting.UserPostingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/user/posting")
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
}
