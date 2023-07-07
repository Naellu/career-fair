package com.project.careerfair.config;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

@Configuration
@EnableMethodSecurity
public class CustomConfig {
    @Value("${aws.accessKeyId}")
    private String accessKeyId;
    @Value("${aws.secretAccessKey}")
    private String secretAccessKey;

    @Value("${aws.bucketUrl}")
    private String bucketUrl;

    @Autowired
    private ServletContext application;

    @PostConstruct
    public void init() {
        application.setAttribute("bucketUrl",bucketUrl);
    }

    @Bean
    public S3Client s3Client() {
        AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId,secretAccessKey);
        AwsCredentialsProvider provider = StaticCredentialsProvider.create(credentials);

        S3Client s3client = S3Client.builder()
                .credentialsProvider(provider)
                .region(Region.AP_NORTHEAST_2)
                .build();
        return s3client;
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http.csrf().disable();

        http.formLogin().loginPage("/members/");
        http.logout().logoutUrl("/members/");

        return http.build();
    }
}
