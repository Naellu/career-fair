package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Faq;
import com.project.careerfair.mapper.faq.FaqMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {

    private final FaqMapper faqMapper;

    @Override
    public List<Faq> findAll() {
        log.info("faq IN SERVICE={}",faqMapper.findAll());
        return faqMapper.findAll();
    }

}
