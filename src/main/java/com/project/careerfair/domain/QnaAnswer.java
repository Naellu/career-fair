package com.project.careerfair.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class QnaAnswer {
    private Integer id;
    private Integer qnaId;
    private String content;
    private LocalDateTime created;
    private String memberId;

    private Boolean isWriter;
}
