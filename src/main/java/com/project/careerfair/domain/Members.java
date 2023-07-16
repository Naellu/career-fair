package com.project.careerfair.domain;


import lombok.Data;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class Members {
    private String id;
    private String password;
    private String name;
    private String gender;
    private Integer isActive;
    private String phoneNumber;
    private String memberType;
    private String email;
    private String address;
    private String zipCode;
    private List<String> authority;
}
