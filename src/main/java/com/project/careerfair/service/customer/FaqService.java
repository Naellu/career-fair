package com.project.careerfair.service.customer;

import com.project.careerfair.domain.faq.Faq;
import org.springframework.stereotype.Service;

import java.util.List;

public interface FaqService {

    List<Faq> findAll();

}
