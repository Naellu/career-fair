package com.project.careerfair.interceptor;

import com.project.careerfair.domain.exhibitionInfo.ExhibitionInfo;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@RequiredArgsConstructor
public class ExhibitionInterceptor implements HandlerInterceptor {

    private final ExhibitionInfoService exhibitionInfoService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        if (modelAndView != null && !modelAndView.getViewName().startsWith("redirect:")) {
            ExhibitionInfo exhibitionInfo = exhibitionInfoService.getCurrentInfo();
            modelAndView.addObject("exhibitionInfo", exhibitionInfo);
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // nobody
    }
}
