package com.project.careerfair.mapper.customer;

import com.project.careerfair.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDateTime;
import java.util.List;

@Mapper
public interface NoticeMapper {

    // 글목록
    List<Notice> getNoticeList(Integer startNum, Integer pageSize, String search, String type);

    // 글 개수
    Integer countAll(String type, String search);

    // 글 상세
    Notice getDetail(Integer noticeId);

    //이전글
    Integer getPrevNotice(Integer noticeId, LocalDateTime modified);

    //다음글
    Integer getNextNotice(Integer noticeId, LocalDateTime modified);

    //첫번째글
    Integer getFirstNotice(Integer noticeId);

    //마지막글
    Integer getLastNotice(Integer noticeId);

    // 업데이트
    int update(Notice notice);

    //파일테이블에 이름추가
    void insertFileName(Integer noticeId, String originalFilename);

    // 특정공지 특정 파일삭제
    void deleteFileNameByNoticeIdAndFileName(Integer noticeId, String fileName);

    //공지 추가
    int insert(Notice notice);

    // 공지id로 파일 목록 불러오기
    List<String> selectFileNamesByNoticeId(Integer noticeId);

    // 아이디로 공지 삭제
    int deleteById(Integer noticeId);

    //id로 테이블에서 파일삭제
    void deleteFileNameByNoticeId(Integer noticeId);
}

