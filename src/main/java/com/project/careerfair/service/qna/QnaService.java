package com.project.careerfair.service.qna;

import com.project.careerfair.domain.QnaQuestion;


import java.util.List;
import java.util.Map;


public interface QnaService {

    Boolean addQuestion(QnaQuestion question);

    List<QnaQuestion> readQuestion();

    QnaQuestion getQuestion(Integer id);

    boolean remove(Integer id);

    boolean modify(QnaQuestion question);
}
