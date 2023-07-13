package com.project.careerfair.service.qna;

import com.project.careerfair.domain.QnaAnswer;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface QnaAnswerService {
    List<QnaAnswer> list(Integer questionId, Authentication authentication);

    Map<String, Object> add(QnaAnswer answer);

    QnaAnswer get(Integer id);
}
