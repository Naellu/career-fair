package com.project.careerfair.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class QnaQuestion {
    private Integer id;
    private String title;
    private String content;
    private String memberId;
    private LocalDateTime created;
    public Boolean isAnswered;

    private Integer answerCount;
}
