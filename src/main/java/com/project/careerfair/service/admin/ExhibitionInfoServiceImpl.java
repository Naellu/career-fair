package com.project.careerfair.service.admin;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.ExhibitionInfo;
import com.project.careerfair.mapper.exhibitionInfo.ExhibitionInfoMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.Map;

@Service
@Slf4j
@RequiredArgsConstructor
public class ExhibitionInfoServiceImpl implements ExhibitionInfoService {

    private final ExhibitionInfoMapper exhibitionInfoMapper;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;


    @Override
    public Integer getCurrentRound() {
        return exhibitionInfoMapper.getCurrentRound();
    }

    @Override
    public Map<String, Object> getCurrentInfo() {
        Integer round = exhibitionInfoMapper.getCurrentRound();

        ExhibitionInfo exhibitionInfo = exhibitionInfoMapper.getCurrentInfo(round);

        return Map.of("exhibitionInfo", exhibitionInfo);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean reg(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException {
        Integer cnt = exhibitionInfoMapper.insert(exhibitionInfo);

        if (files != null) {
            fileToS3(exhibitionInfo, files);
        }

        return cnt == 1;
    }

    // 파일 등록 메소드
    public void fileToS3(ExhibitionInfo exhibitionInfo, MultipartFile[] files) throws IOException {
        // 파일등록
        for (MultipartFile file : files) {
            if (file.getSize() > 0) {
                String objectKey = "career_fair/exhibitionInfo/" + exhibitionInfo.getRound() + "/" + file.getOriginalFilename();

                // s3에 파일 업로드
                PutObjectRequest por = PutObjectRequest.builder()
                        .bucket(bucketName)
                        .acl(ObjectCannedACL.PUBLIC_READ)
                        .key(objectKey)
                        .build();
                RequestBody rb = RequestBody.fromInputStream(file.getInputStream(),
                        file.getSize());

                s3.putObject(por, rb);

                // db에 관련정보저장 (insert)
                exhibitionInfoMapper.insertFileName(exhibitionInfo.getRound(), file.getOriginalFilename());
            }
        }
    }
}
