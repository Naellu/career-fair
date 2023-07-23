package com.project.careerfair.controller.scrap;

import com.project.careerfair.mapper.scrap.ScrapMapper;
import com.project.careerfair.service.scrap.ScrapService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/scrap/")
public class ScrapControllerAPI {

    private final ScrapService scrapService;

    @PostMapping("{postingId}")
    public ResponseEntity<Map<String, Object>> scrap(@PathVariable Integer postingId, Authentication authentication) {
        if (authentication == null) {
            return ResponseEntity
                    .status(403)
                    .build();
        } else {
            Map<String, Object> result = scrapService.scrap(postingId, authentication);
            return ResponseEntity.ok(result);
        }
    }


}
