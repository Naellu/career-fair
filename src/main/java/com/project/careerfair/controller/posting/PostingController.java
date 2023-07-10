package com.project.careerfair.controller.posting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posting")
public class PostingController {

    @GetMapping("add")
    public void addForm(){

    }

}
