package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Faq;

import java.util.List;

public interface FaqService {

    List<Faq> findAll();

    Integer addNewFAQ(Faq faq);

}
