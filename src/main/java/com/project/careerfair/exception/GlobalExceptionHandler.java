package com.project.careerfair.exception;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
    // 404페이지 오류
    @ExceptionHandler(NoHandlerFoundException.class)
    public String handle404(NoHandlerFoundException ex, Model model) {
        // 404 에러 처리 로직 구현
        String message = "요청한 페이지를 찾을 수 없습니다.";
        model.addAttribute("message", message);
        return "error/404"; // 404 에러 페이지로 리디렉션
    }

    @ExceptionHandler(AccessDeniedException.class)
    public String handle403(AccessDeniedException ex, Model model) {
        // 404 에러 처리 로직 구현
        String message = "권한이 없습니다.";
        model.addAttribute("message", message);
        return "error/403"; // 404 에러 페이지로 리디렉션
    }
}
