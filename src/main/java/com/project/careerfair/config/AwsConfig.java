package com.project.careerfair.config;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;

@Configuration
public class AwsConfig {

    @Value("${aws.accessKeyId}")
    private String accessKey;

    @Value("${aws.secretAccessKey}")
    private String secretKey;

    @Autowired
    private ServletContext application;

    @Value("${aws.bucketUrl}")
    private String bucketUrl;

    @PostConstruct
    public void init() {
        application.setAttribute("bucketUrl", bucketUrl);
    }

    @Bean
    public S3Client S3Client() {
        AwsCredentials credentials = AwsBasicCredentials.create(accessKey, secretKey);
        AwsCredentialsProvider provider = StaticCredentialsProvider.create(credentials);
        Region region =  Region.AP_NORTHEAST_2;

        S3Client s3client = S3Client.builder()
                .credentialsProvider(provider)
                .region(region)
                .build();

        return s3client;
    }

}
