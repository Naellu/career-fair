package com.project.careerfair.service.recruiter;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface RecruiterService {
    List<Industry> getIndustryList();

    boolean create(Company company, MultipartFile[] files) throws IOException;
}
