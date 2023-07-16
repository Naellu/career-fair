package com.project.careerfair.service.admin;

import com.project.careerfair.mapper.exhibitionInfo.ExhibitionInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class ExhibitionInfoServiceImpl implements ExhibitionInfoService{

    private final ExhibitionInfoMapper exhibitionInfoMapper;

    @Override
    public Integer getCurrentRound() {
        return exhibitionInfoMapper.getCurrentRound();
    }
}
