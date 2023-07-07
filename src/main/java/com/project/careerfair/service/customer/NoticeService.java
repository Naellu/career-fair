package com.project.careerfair.service.customer;

import com.project.careerfair.domain.Notice;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface NoticeService {
    Map<String, Object> getNoticeList(String search, String type, Integer page);

    Map<String, Object> getDetail(Integer noticeId);

    boolean create(Notice notice, MultipartFile[] files) throws IOException;

    boolean modify(Notice notice, MultipartFile[] files, List<String> removeFileNames) throws IOException;

    boolean delete(Integer noticeId);
}
