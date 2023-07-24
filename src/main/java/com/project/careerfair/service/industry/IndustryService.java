package com.project.careerfair.service.industry;

import com.project.careerfair.domain.Industry;

import java.util.List;

public interface IndustryService {
    List<Industry> getIndustryList();

    Industry findIndustryNameById(Integer industryId);
}
