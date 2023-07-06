package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.service.customer.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.services.s3.S3Client;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/notices")
@RequiredArgsConstructor
@Slf4j
public class NoticeControllerAPI {

    private final NoticeService noticeService;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    @GetMapping
    public ResponseEntity<Map<String, Object>> getList(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "page", defaultValue = "1") Integer page) {
        Map<String, Object> result = noticeService.getNoticeList(search, type, page);
        return ResponseEntity.ok(result);
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
            @RequestParam(value = "files", required = false) MultipartFile[] files) {
        try {
            boolean ok = noticeService.modify(notice, files, removeFileNames);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok()
                .body(Collections.singletonMap("message", "Notice modified successfully."));
    }
}
