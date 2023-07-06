package com.project.careerfair.domain.faq;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {

    private Integer faqId;
    private String title;
    private String content;

}
