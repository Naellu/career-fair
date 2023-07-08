package com.project.careerfair.service.user;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.industry.IndustryMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.List;

@Service("userRecruiterServiceImpl")
@Slf4j
@RequiredArgsConstructor
public class RecruiterServiceImpl implements RecruiterService {

    private final IndustryMapper industryMapper;

    private final CompanyMapper companyMapper;

    private final ExhibitionInfoService exhibitionInfoService;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    @Override
    public List<Industry> getIndustryList() {
        return industryMapper.getIndustryList();
    }

    @Override
    public boolean create(Company company, MultipartFile[] files) throws IOException {
        Integer round = exhibitionInfoService.getCurrentRound();
        company.setRound(round);
        company.setMemberId("chuncom");
        company.setStatus("review");

        int cnt = companyMapper.insert(company);

        fileToS3(company, files);

        return cnt == 1;
    }

    // 파일 등록 메소드
    public void fileToS3(Company company, MultipartFile[] files) throws IOException {
        // 파일등록
        for (MultipartFile file : files) {
            if (file.getSize() > 0) {
                String objectKey = "career_fair/company/" + company.getCompanyId() + "/" + file.getOriginalFilename();

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
                companyMapper.insertFileName(company.getCompanyId(), file.getOriginalFilename());
            }
        }
    }
}
