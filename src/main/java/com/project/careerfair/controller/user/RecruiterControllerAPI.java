package com.project.careerfair.controller.user;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.service.industry.IndustryService;
import com.project.careerfair.service.user.RecruiterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("userRecruiterControllerAPI ")
@Slf4j
@RequestMapping("/api/user/recruiter/")
@PreAuthorize("hasAuthority('recruiter') or hasAuthority('admin')")
@RequiredArgsConstructor
public class RecruiterControllerAPI {

    private final RecruiterService recruiterService;

    private final IndustryService industryService;

    // 업종목록 불러오기
    @GetMapping("industry")
    public List<Industry> industryList() {
        return industryService.getIndustryList();
    }

    // 참여기업신청하기
    @PostMapping
    public ResponseEntity<Map<String, Object>> regCompany(
            Company company,
            @RequestParam("files") MultipartFile[] files,
            Authentication authentication) {
        boolean ok = false;
        Map<String, Object> response = new HashMap<>();

        if (authentication == null) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }

        try {
            ok = recruiterService.create(company, files, authentication);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        if (ok) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

   /* @PostMapping
    public ResponseEntity<Map<String, Object>> regCompany(
            @Validated @ModelAttribute("company") Company company,
            BindingResult bindingResult,
            @RequestParam("files") MultipartFile[] files,
            Authentication authentication) {

        if (bindingResult.hasErrors()) {
            // 오류가 있는 경우
            Map<String, Object> errors = new HashMap<>();
            for (FieldError error : bindingResult.getFieldErrors()) {
                errors.put(error.getField(), error.getDefaultMessage());
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errors);
        }

        boolean ok = false;
        try {
            ok = recruiterService.create(company, files, authentication);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Map<String, Object> response = new HashMap<>();

        if (ok) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }*/

    // 목록 불러오기
    @GetMapping
    public ResponseEntity<Map<String, Object>> getCompanies(
            @RequestParam(value = "roundValue", required = false) String roundValue,
            Authentication authentication) {
        Map<String, Object> result = recruiterService.getList(roundValue, authentication.getName());
        return ResponseEntity.ok(result);
    }

    // 상세 불러오기
    @GetMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> getCompany(@PathVariable("companyId") Integer companyId) {
        Map<String, Object> result = recruiterService.getDetail(companyId);
        return ResponseEntity.ok(result);
    }


    @PostMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> modifyCompany(
            @PathVariable("companyId") Integer companyId,
            Company company,
            @RequestParam(value = "removeFiles", required = false) List<String> removeFileNames,
            @RequestParam(value = "files", required = false) MultipartFile[] files) {
        try {
            boolean ok = recruiterService.modify(company, files, removeFileNames);
            Map<String, Object> response = new HashMap<>();
            if (ok) {
                response.put("message", "수정되었습니다.");
                return ResponseEntity.ok(response);
            } else {
                response.put("message", "수정에실패하였습니다.");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
