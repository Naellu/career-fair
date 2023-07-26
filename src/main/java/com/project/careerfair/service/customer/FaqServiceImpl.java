package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Faq;
import com.project.careerfair.domain.Notice;
import com.project.careerfair.mapper.faq.FaqMapper;
import com.project.careerfair.mapper.notice.NoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {

    private final FaqMapper faqMapper;

    private final NoticeMapper noticeMapper;

//    @Override
//    public List<Faq> findAll() {
//        return faqMapper.findAll();
//    }
    @Override
    public List<Faq> findAll(String search, String type) {
        return faqMapper.findAll(search, type);
    }

    @Override
    public Integer addNewFAQ(Faq faq) {
        return faqMapper.writeNewFAQ(faq);
    }

    @Override
    public Integer update(Faq faq) {
        return faqMapper.update(faq);
    }

    @Override
    public Integer delete(Integer faqId) {
        return faqMapper.delete(faqId);

    }

    @Override
    public List<Notice> getTopNoticeList() {
        return noticeMapper.getTopNoticeList();
    }

}
