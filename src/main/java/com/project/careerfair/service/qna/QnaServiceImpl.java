package com.project.careerfair.service.qna;

import com.project.careerfair.domain.Notice;
import com.project.careerfair.domain.QnaAnswer;
import com.project.careerfair.domain.QnaQuestion;
import com.project.careerfair.mapper.notice.NoticeMapper;
import com.project.careerfair.mapper.qna.QnaAnswerMapper;
import com.project.careerfair.mapper.qna.QnaMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {

    private final QnaMapper mapper;

    private final QnaAnswerMapper answerMapper;

    private final NoticeMapper noticeMapper;

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

        int cnt2 = answerMapper.deleteByQnaId(id);
        int cnt = mapper.deleteById(id);

        return cnt == 1 && cnt2 == 1;
    }

    @Override
    public boolean modify(QnaQuestion question) {

        int cnt = mapper.modify(question);

        return cnt == 1;
    }

    @Override
    public QnaQuestion getAnswerCount(Integer id) {
        QnaQuestion question = mapper.selectById(id);
        Integer answerCount = mapper.selectAnswerCount(id);
        question.setAnswerCount(answerCount != null ? answerCount : 0);
        return question;
    }

    @Override
    public List<Notice> getTopNoticeList() {
        return noticeMapper.getTopNoticeList();
    }

    @Override
    public Map<String, Object> readQuestion(Integer page) {
        Integer rowPerPage = 7;

        page = Math.max(page, 1);

        Integer startIndex = (page - 1) * rowPerPage;

        Integer numOfRecords = mapper.countAll();

        Integer lastPageNumber = (numOfRecords - 1) / rowPerPage + 1;

        Integer leftPageNum = page - 5;
        leftPageNum = Math.max(leftPageNum, 1);

        Integer rightPageNum = leftPageNum + 9;
        rightPageNum = Math.min(rightPageNum, lastPageNumber);

        Map<String, Object> pageInfo = new HashMap<>();
        pageInfo.put("rightPageNum", rightPageNum);
        pageInfo.put("leftPageNum", leftPageNum);
        pageInfo.put("currentPageNum", page);
        pageInfo.put("lastPageNum", lastPageNumber);

        List<QnaQuestion> list = mapper.selectAllPaging(startIndex, rowPerPage);

        pageInfo.put("questionList", list);

        return pageInfo;
    }


}
