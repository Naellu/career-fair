package com.project.careerfair.service.admin;

import com.project.careerfair.domain.ExhibitionInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface ExhibitionInfoService {
    // 현재 회차 번호 얻기
    Integer getCurrentRound();

    // 현재 회차 정보 얻기
    ExhibitionInfo getCurrentInfo();

    // 회차 등록하기
    Boolean reg(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException;
}
