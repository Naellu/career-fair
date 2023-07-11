package com.project.careerfair.mapper.qna;

import com.project.careerfair.domain.QnaQuestion;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface QnaMapper {

    @Insert("""
			INSERT INTO TB_QNA (title, content, member_id)
			VALUES (#{title}, #{content}, #{memberId})
			""")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(QnaQuestion qna);

    @Select("""
            SELECT * FROM TB_QNA
            ORDER BY qna_id DESC
            """)
    @ResultMap("qnaMap")
    List<QnaQuestion> selectAll();

    @Select("""
            SELECT * FROM TB_QNA
            WHERE qna_id = #{id}
            """)
    @ResultMap("qnaMap")
    QnaQuestion selectById(Integer id);

}
