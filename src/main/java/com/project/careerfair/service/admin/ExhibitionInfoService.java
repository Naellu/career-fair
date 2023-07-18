package com.project.careerfair.service.admin;

import com.project.careerfair.domain.ExhibitionInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ExhibitionInfoService {
    Integer getCurrentRound();

    ExhibitionInfo getCurrentInfo();

    Boolean reg(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException;
}
