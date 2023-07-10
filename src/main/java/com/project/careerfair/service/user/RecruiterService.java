package com.project.careerfair.service.user;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import org.springframework.security.core.Authentication;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface RecruiterService {
    // 산업 정보
    List<Industry> getIndustryList();

    // 신청 등록
    boolean create(Company company, MultipartFile[] files, Authentication authentication) throws IOException;

    // 신청 현황 보기
    Map<String, Object> getList(String roundValue, String memberId);

    Map<String, Object> getDetail(Integer companyId);

    boolean modify(Company company, MultipartFile[] files, List<String> removeFileNames) throws IOException;


}
