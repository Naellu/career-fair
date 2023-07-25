package com.project.careerfair;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import software.amazon.awssdk.services.s3.S3Client;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

@RunWith(SpringRunner.class)
@SpringBootTest(properties = {"property.value=propertyTest"}
    , classes = {CareerFairApplication.class}
    , webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class CareerFairApplicationTests {

    @Value("${property.value}")
    private String propertyValue;

    @Test
    public void contextLoads() {
        assertThat(propertyValue, is("propertyTest"));
    }

}
