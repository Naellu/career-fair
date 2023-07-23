package com.project.careerfair.mapper.exhibitionInfo;

import com.project.careerfair.domain.exhibitionInfo.ExhibitionInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ExhibitionInfoMapper {

    //현재회차 번호
    Integer getCurrentRound();

    //현재 회차 정보 얻기
    ExhibitionInfo getCurrentInfo(Integer round);

    // 회차 정보 삽입하기
    Integer insert(ExhibitionInfo exhibitionInfo);

    //회차 파일 삽입하기
    void insertFileName(Integer round, String originalFilename);

    // 특정회차의 특정 파일 삭제하기
    void deleteFileNameByRoundAndFileName(Integer round, String fileName);

    // 회차 테이블 업데이트
    Integer update(ExhibitionInfo exhibitionInfo);
}
