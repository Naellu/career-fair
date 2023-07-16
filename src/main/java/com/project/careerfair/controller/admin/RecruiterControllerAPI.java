package com.project.careerfair.controller.admin;

import com.project.careerfair.service.admin.RecruiterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController("adminRecruiterControllerAPI")
@Slf4j
@RequestMapping("/api/admin/recruiter/")
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('admin')")
public class RecruiterControllerAPI {

    private final RecruiterService recruiterService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getRecruiters(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        Map<String, Object> result = recruiterService.getList(search, type, page, status);
        return ResponseEntity.ok(result);
    }

    @GetMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> getRecruiterDetail(@PathVariable("companyId") Integer companyId) {
        Map<String, Object> result = recruiterService.getDetail(companyId);
        return ResponseEntity.ok(result);
    }

    @PatchMapping("{companyId}")
    public ResponseEntity<Void> updateRecruiterStatus(
            @PathVariable("companyId") Integer companyId,
            @RequestBody Map<String, String> statusMap) {
        boolean ok = recruiterService.changeStatus(companyId, statusMap);
        if (ok) {
            return ResponseEntity.ok().build(); // 200 OK 응답
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 500 내부 서버 오류 응답
        }
    }

}
