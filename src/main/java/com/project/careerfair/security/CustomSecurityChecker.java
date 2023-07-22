package com.project.careerfair.security;

import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.domain.QnaQuestion;
import com.project.careerfair.mapper.qna.QnaAnswerMapper;
import com.project.careerfair.mapper.qna.QnaMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class CustomSecurityChecker {

    private final QnaMapper qnaMapper;

    private final QnaAnswerMapper answerMapper;

    public boolean checkQnaWriter(Authentication authentication, Integer qnaId) {
        QnaQuestion question = qnaMapper.selectById(qnaId);

        return question.getMemberId().equals(authentication.getName());
    }

    public boolean checkQnaAnswerWriter(Authentication authentication, Integer answerId) {
        QnaAnswer answer = answerMapper.selectById(answerId);

        return answer.getMemberId().equals(authentication.getName());
    }

}
