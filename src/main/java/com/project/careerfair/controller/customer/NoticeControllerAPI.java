package com.project.careerfair.controller.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.service.customer.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/customer/notice/api/")
@RequiredArgsConstructor
@Slf4j
public class NoticeControllerAPI {

    private final NoticeService noticeService;

    @GetMapping("list")
    public ResponseEntity<List<Notice>> getList(
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "page", defaultValue = "1") String page) {
        // 비즈니스 로직을 수행하여 Notice 리스트를 가져오는 코드
        List<Notice> noticeList = noticeService.getNoticeList(search, type);
        log.info("log: {}, {}, {}", search, type, page);
        return ResponseEntity.ok(noticeList);
    }
}
