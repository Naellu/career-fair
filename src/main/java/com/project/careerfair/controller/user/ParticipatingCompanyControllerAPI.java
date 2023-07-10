package com.project.careerfair.controller.user;

import com.project.careerfair.service.user.ParticipatingCompanyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/company/")
public class ParticipatingCompanyControllerAPI {

    private final ParticipatingCompanyService participatingCompanyService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getList(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "industryId", required = false) Integer industryId,
            @RequestParam(value = "roundValue", required = false) Integer roundValue) {
        Map<String, Object> result = participatingCompanyService.getList(search, type, industryId, roundValue);
        return ResponseEntity.ok(result);
    }


}
