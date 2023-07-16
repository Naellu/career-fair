package com.project.careerfair.service.customer;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

import static org.junit.jupiter.api.Assertions.fail;

@SpringBootTest
public class NoticeServiceImplTest {

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    @Autowired
    private S3Client s3;
    @Test
    void test1() {
//        String objectKey = "career_fair/notice/125/15.1.1 spe.png";
//        String objectKey = "career_fair/notice/13/15.1.1 spe.png";
        String objectKey = "career_fair/notice/125/15.1.1 spe.png";
        DeleteObjectRequest dor = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(objectKey)
                .build();
        System.out.println("objectKey = " + objectKey);
        System.out.println("bucketName = " + bucketName);

        s3.deleteObject(dor);
    }

}