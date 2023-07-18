package com.project.careerfair.domain;

import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class QnaAnswer {
    private Integer id;
    private Integer qnaId;
    private String content;
    private LocalDateTime created;
    private String memberId;

    private Boolean isWriter;

    public String getCreated() {
        return created.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }
}
