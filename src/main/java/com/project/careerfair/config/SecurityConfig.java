package com.project.careerfair.config;

import jakarta.websocket.Session;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable();

        http.formLogin()
                .loginPage("/login")
                .failureHandler((request, response, exception) -> {

                    String errorMessage = null;
                    int sessionTimeoutInMinutes = 1;
                    if (exception instanceof DisabledException) {
                        // 잠긴 계정의 경우 실패 처리 로직 구현
                        // 시간설정 오래 있을 필요조차 없음.
                        response.sendRedirect("/login/locked");
                    } else if (exception instanceof BadCredentialsException) {
                        errorMessage = "아이디 또는 비밀번호가 잘못되었습니다.";
                        request.getSession().setMaxInactiveInterval(sessionTimeoutInMinutes);
                        request.getSession().setAttribute("message", errorMessage);
                        response.sendRedirect("/login");
                    } else {
                        errorMessage = "로그인에 실패하였습니다. 다시 시도해주세요.";
                        request.getSession().setMaxInactiveInterval(sessionTimeoutInMinutes);
                        request.getSession().setAttribute("message", errorMessage);
                        response.sendRedirect("/login");
                    }
                });

        http.logout()
                .logoutUrl("/login/logout")
                .logoutSuccessUrl("/");


//        http.csrf().disable().cors().disable()
//                .authorizeHttpRequests(request -> request
//                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
//                        .requestMatchers("/").permitAll() // 경로 설정해서 로그인 안해도 들어갈 수 있게 하는 곳들
//                        .anyRequest().authenticated()
//                )
//                .formLogin(login -> login
//                        .loginPage("/login/login") // 커스텀 로그인 페이지
//                        .loginProcessingUrl("/login-process") // submit 받을 url
//                        .usernameParameter("userid") // submit 할 아이디
//                        .passwordParameter("pw") // submit 할 비밀번호
//                        .defaultSuccessUrl("/", true)
//                        .permitAll()
//                )
//                .logout(Customizer.withDefaults());

        return http.build();
    }

    @Bean
    public HttpFirewall defaultHttpFirewall() {
        return new DefaultHttpFirewall();
    }
}
