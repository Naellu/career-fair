package com.project.careerfair.service.qna;

import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.mapper.qna.QnaAnswerMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class QnaAnswerServiceImpl implements QnaAnswerService{

    private final QnaAnswerMapper mapper;

    @Override
    public List<QnaAnswer> list(Integer questionId, Authentication authentication) {
        List<QnaAnswer> answers = mapper.selectAllByQuestionId(questionId);
        if (authentication != null) {
            for (QnaAnswer answer : answers) {
                answer.setIsWriter(authentication.getAuthorities().stream()
                        .anyMatch(auth -> auth.getAuthority().equals("company")));

                answer.setIsWriter(authentication.getAuthorities().stream()
                        .anyMatch(auth -> auth.getAuthority().equals("recruiter")));

                answer.setIsWriter(authentication.getAuthorities().stream()
                        .anyMatch(auth -> auth.getAuthority().equals("admin")));
            }
        }
        return answers;
    }

    @Override
    public Map<String, Object> add(QnaAnswer answer) {

        var res = new HashMap<String, Object>();

        int cnt = mapper.insert(answer);
        if (cnt == 1) {
            res.put("message", "답변이 등록되었습니다.");
        } else {
            res.put("message", "답변이 등록되지 않았습니다.");
        }



        return res;
    }

    @Override
    public QnaAnswer get(Integer id) {

        return mapper.selectById(id);
    }
}
