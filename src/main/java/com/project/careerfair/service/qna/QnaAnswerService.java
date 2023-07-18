package com.project.careerfair.service.qna;

import com.project.careerfair.domain.QnaAnswer;
import org.springframework.security.core.Authentication;

import java.util.List;
import java.util.Map;

public interface QnaAnswerService {
    List<QnaAnswer> list(Integer qnaId, Authentication authentication);

    Map<String, Object> add(QnaAnswer answer, Authentication authentication);

    QnaAnswer get(Integer id);

    Map<String, Object> remove(Integer id);
}
