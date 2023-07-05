package com.project.careerfair.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Note {

    private Integer noteId;
    private String senderId;
    private String recipientId;
    private String title;
    private String content;
    private LocalDateTime created;
    private Boolean status;




}
