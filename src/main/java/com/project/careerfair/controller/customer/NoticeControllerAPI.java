package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.customer.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.services.s3.S3Client;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/notices")
@RequiredArgsConstructor
@Slf4j
public class NoticeControllerAPI {

    private final NoticeService noticeService;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getList(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        Map<String, Object> result = noticeService.getNoticeList(search, type, page);
        return ResponseEntity.ok(result);
    }

    @PostMapping
    public ResponseEntity<Map<String, Object>> create(
            Notice notice,
            @RequestParam(value = "files", required = false) MultipartFile[] files,
            Authentication authentication) {
        try {
            boolean ok = noticeService.create(notice, files, authentication);
            Map<String, Object> response = new HashMap<>();
            if (ok) {
                // 생성이 성공한 경우에는 적절한 응답을 반환
                response.put("message", "등록되었습니다.");
                return ResponseEntity.ok(response);
            } else {
                // 생성이 실패한 경우에는 적절한 응답을 반환
                response.put("message", "등록에 실패하였습니다.");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("{noticeId}")
    public ResponseEntity<Map<String, Object>> detail(@PathVariable("noticeId") Integer noticeId) {
        Map<String, Object> result = noticeService.getDetail(noticeId);
        return ResponseEntity.ok(result);
    }

    @PostMapping("{noticeId}")
    public ResponseEntity<Map<String, Object>> modify(
            @PathVariable("noticeId") Integer noticeId,
            Notice notice,
            @RequestParam(value = "removeFiles", required = false) List<String> removeFileNames,
            @RequestParam(value = "files", required = false) MultipartFile[] files,
            Authentication authentication) {
        try {
            boolean ok = noticeService.modify(notice, files, removeFileNames,authentication);
            Map<String, Object> response = new HashMap<>();
            if (ok) {
                // 수정이 성공한 경우에는 적절한 응답을 반환
                response.put("message", "수정되었습니다.");
                return ResponseEntity.ok(response);
            } else {
                // 수정이 실패한 경우에는 적절한 응답을 반환
                response.put("message", "수정에실패하였습니다.");
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @DeleteMapping("{noticeId}")
    public ResponseEntity<Map<String, Object>> delete(@PathVariable("noticeId") Integer noticeId) {
        boolean ok = noticeService.delete(noticeId);

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
