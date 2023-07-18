package com.project.careerfair.service.admin;

import com.project.careerfair.domain.ExhibitionInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

public interface ExhibitionInfoService {
    Integer getCurrentRound();

    Map<String, Object> getCurrentInfo();

    Boolean reg(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException;
}
