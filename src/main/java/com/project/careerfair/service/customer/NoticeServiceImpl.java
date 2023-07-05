package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.mapper.customer.NoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;

    @Override
    public List<Notice> getNoticeList(String search, String type) {
        List<Notice> noticeList = noticeMapper.getNoticeList(search, type);
        return noticeList;
    }
}
