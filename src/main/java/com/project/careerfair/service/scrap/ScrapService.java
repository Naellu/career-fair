package com.project.careerfair.service.scrap;

import org.springframework.security.core.Authentication;

import java.util.Map;

public interface ScrapService {
    Map<String, Object> scrap(Integer postingId, Authentication authentication);
}
