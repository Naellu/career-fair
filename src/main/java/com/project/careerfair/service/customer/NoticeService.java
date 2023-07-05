package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Notice;

import java.util.List;

public interface NoticeService {
    List<Notice> getNoticeList(String search, String type);
}
