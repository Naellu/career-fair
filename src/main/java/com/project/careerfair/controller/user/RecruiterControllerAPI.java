package com.project.careerfair.controller.user;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.domain.Notice;
import com.project.careerfair.mapper.industry.IndustryMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.user.RecruiterService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("userRecruiterControllerAPI ")
@Slf4j
@RequestMapping("/api/user/recruiter/")
@RequiredArgsConstructor
public class RecruiterControllerAPI {

    private final RecruiterService recruiterService;

    // 업종목록 불러오기
    @GetMapping("industry")
    public List<Industry> industryList() {
        return recruiterService.getIndustryList();
    }

    // 참여기업신청하기
    @PostMapping
    public ResponseEntity<Map<String, Object>> reg(
            Company company,
            @RequestParam("files") MultipartFile[] files,
            Authentication authentication) {
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
    }

    // 목록 불러오기
    @GetMapping
    public ResponseEntity<Map<String, Object>> getList(
            @RequestParam(value = "roundValue", required = false) String roundValue,
            Authentication authentication) {
        log.info("ddd");
        Map<String, Object> result = recruiterService.getList(roundValue, authentication.getName());
        return ResponseEntity.ok(result);
    }

    // 상세 불러오기
    @GetMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("companyId") Integer companyId) {
        Map<String, Object> result = recruiterService.getDetail(companyId);
        return ResponseEntity.ok(result);
    }


    @PostMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> modify(
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

 @DeleteMapping("{companyId}")
    public ResponseEntity<Map<String, Object>> delete(@PathVariable("companyId") Integer companyId) {
        boolean ok = recruiterService.delete(companyId);

        Map<String, Object> response = new HashMap<>();
        if (ok) {
            // 삭제가 성공한 경우에는 적절한 응답을 반환
            response.put("message", "삭제되었습니다.");
            return ResponseEntity.ok(response);
        } else {
            // 삭제가 실패한 경우에는 적절한 응답을 반환
            response.put("message", "삭제에 실패하였습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
