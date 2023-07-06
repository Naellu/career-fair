package com.project.careerfair.domain;


import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Data
@Repository
public class Members {
    private String id;
    private String password;
    private String name;
    private String gender;
    private Boolean isActive;
    private String phoneNumber;
    private String email;
    private String memberType;
    private String address;

}
