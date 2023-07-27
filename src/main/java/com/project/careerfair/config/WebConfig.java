package com.project.careerfair.config;

import com.project.careerfair.interceptor.ExhibitionInterceptor;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    private final ExhibitionInfoService exhibitionInfoService;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new ExhibitionInterceptor(exhibitionInfoService))
                .addPathPatterns("/**");
    }
}
