package com.project.careerfair.mapper.qna;

import com.project.careerfair.domain.QnaAnswer;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface QnaAnswerMapper {

    @Select("""
			SELECT *
			FROM TB_QNA_ANSWER
			WHERE qna_id = #{qnaId}
			ORDER BY answer_id
			""")
    @ResultMap("answerMap")
    List<QnaAnswer> selectAllByQuestionId(Integer questionId);

    @Insert("""
			INSERT INTO TB_QNA_ANSWER (qna_id, content, member_id)
			VALUES (#{qnaId}, #{content}, #{memberId})
			""")
    @ResultMap("answerMap")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Integer insert(QnaAnswer answer);

    @Select("""
			SELECT *
			FROM TB_QNA_ANSWER
			WHERE answer_id = #{id}
			""")
    @ResultMap("answerMap")
    QnaAnswer selectById(Integer id);

}
