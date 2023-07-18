package com.project.careerfair.domain;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class QnaQuestion {
    private Integer id;
    private String title;
    private String content;
    private String memberId;
    private LocalDateTime created;
    public Boolean isAnswered;

    private Integer answerCount;

    public String getCreated() {
        return created.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }
}
