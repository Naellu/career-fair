package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Faq;
import com.project.careerfair.domain.Notice;

import java.util.List;

public interface FaqService {

//    List<Faq> findAll();
    List<Faq> findAll(String search, String type);

    Integer addNewFAQ(Faq faq);
    Integer update(Faq faq);
    Integer delete(Integer faq);

    List<Notice> getTopNoticeList();
}
