package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.customer.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
    public ResponseEntity<Map<String, Object>> getNotices(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        Map<String, Object> result = noticeService.getNoticeList(search, type, page);
        return ResponseEntity.ok(result);
    }

    @PostMapping
    @PreAuthorize("hasAuthority('admin')")
    public ResponseEntity<Map<String, Object>> createNotice(
            Notice notice,
            @RequestParam(value = "files", required = false) MultipartFile[] files,
            Authentication authentication) {

        try {
            boolean ok = noticeService.create(notice, files, authentication);

            Map<String, Object> response = new HashMap<>();
            if (ok) {
                // 생성 성공
                return ResponseEntity.ok(response);
            } else {
                // 생성 실패
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("{noticeId}")
    public ResponseEntity<Map<String, Object>> getNotice(@PathVariable("noticeId") Integer noticeId) {
        Map<String, Object> result = noticeService.getDetail(noticeId);
        return ResponseEntity.ok(result);
    }

    @PostMapping("{noticeId}")
    @PreAuthorize("hasAuthority('admin')")
    public ResponseEntity<Map<String, Object>> modifyNotice(
            @PathVariable("noticeId") Integer noticeId,
            Notice notice,
            @RequestParam(value = "removeFiles", required = false) List<String> removeFileNames,
            @RequestParam(value = "files", required = false) MultipartFile[] files,
            Authentication authentication) {
        try {
            boolean ok = noticeService.modify(notice, files, removeFileNames, authentication);
            Map<String, Object> response = new HashMap<>();
            if (ok) {
                // 수정 성공
                return ResponseEntity.ok(response);
            } else {
                // 수정 실패
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @DeleteMapping("{noticeId}")
    @PreAuthorize("hasAuthority('admin')")
    public ResponseEntity<Map<String, Object>> deleteNotice(@PathVariable("noticeId") Integer noticeId) {
        boolean ok = noticeService.delete(noticeId);

        Map<String, Object> response = new HashMap<>();
        if (ok) {
            // 삭제 성공
            return ResponseEntity.ok(response);
        } else {
            // 삭제 실패
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}
