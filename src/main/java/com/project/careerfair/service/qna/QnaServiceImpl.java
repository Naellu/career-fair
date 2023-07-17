package com.project.careerfair.service.qna;

import com.project.careerfair.domain.QnaQuestion;
import com.project.careerfair.mapper.qna.QnaAnswerMapper;
import com.project.careerfair.mapper.qna.QnaMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{

    private final QnaMapper mapper;

    private final QnaAnswerMapper answerMapper;

    @Override
    public Boolean addQuestion(QnaQuestion question) {

        int cnt = mapper.insert(question);

        return cnt == 1;
    }

    @Override
    public List<QnaQuestion> readQuestion() {

        List<QnaQuestion> list = mapper.selectAll();
//        for (QnaQuestion question : list) {
//            boolean answered = mapper.isAnswered(question.getId());
//            question.setAnswered(answered);
//        }
        return list;
    }

    @Override
    public QnaQuestion getQuestion(Integer id) {

        QnaQuestion question = mapper.selectById(id);

        return question;
    }

    @Override
    public boolean remove(Integer id) {

        int cnt2 = answerMapper.deleteById(id);
        int cnt = mapper.deleteById(id);

        return cnt == 1 && cnt2 == 1;
    }

    @Override
    public boolean modify(QnaQuestion question) {

        int cnt = mapper.modify(question);

        return cnt == 1;
    }

}
