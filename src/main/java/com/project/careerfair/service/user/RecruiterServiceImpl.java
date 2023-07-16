package com.project.careerfair.service.user;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Industry;
import com.project.careerfair.mapper.company.CompanyMapper;
import com.project.careerfair.mapper.industry.IndustryMapper;
import com.project.careerfair.service.admin.ExhibitionInfoService;
import com.project.careerfair.service.industry.IndustryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service("userRecruiterServiceImpl")
@Slf4j
@RequiredArgsConstructor
public class RecruiterServiceImpl implements RecruiterService {

    private final IndustryService industryService;

    private final CompanyMapper companyMapper;

    private final ExhibitionInfoService exhibitionInfoService;

    @Value("${aws.s3.bucketName}")
    private String bucketName;

    private final S3Client s3;

    // 신청
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean create(Company company, MultipartFile[] files, Authentication authentication) throws IOException {
        Integer round = exhibitionInfoService.getCurrentRound();
        company.setRound(round);
        company.setMemberId(authentication.getName());
        company.setStatus("review");

        int cnt = companyMapper.insert(company);

        fileToS3(company, files);

        return cnt == 1;
    }

    // 신청내용 목록
    @Override
    public Map<String, Object> getList(String roundValue, String memberId) {
        Integer round = exhibitionInfoService.getCurrentRound();

        List<Company> companyList = companyMapper.getListByName(roundValue, memberId, round);

        return Map.of("companyList", companyList);
    }

    // 신청내용 상세
    @Override
    public Map<String, Object> getDetail(Integer companyId) {
        Company company = companyMapper.getDetail(companyId);

        List<Industry> industryList = industryService.getIndustryList();
        return Map.of("company", company, "industryList", industryList);
    }

    // 신청내역 수정
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean modify(Company company, MultipartFile[] files, List<String> removeFileNames) throws IOException {
        //파일삭제
        Integer companyId = company.getCompanyId();
        log.info("log : {}", companyId);
        if (removeFileNames != null && !removeFileNames.isEmpty()){
            for ( String fileName: removeFileNames) {
                removeFromS3(companyId, fileName);

                //테이블의 데이터 삭제
                companyMapper.deleteFileNameByCompanyIdAndFileName(companyId, fileName);
            }
        }
        
        // 업데이트
        int cnt = companyMapper.update(company);

        if (files != null) {
            fileToS3(company, files);
        }
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

    // 파일 삭제 메소드
    public void removeFromS3(Integer companyId, String fileName) {
        // 파일 삭제
        String objectKey = "career_fair/company/" + companyId + "/" + fileName;

        DeleteObjectRequest dor = DeleteObjectRequest.builder()
                .bucket(bucketName)
                .key(objectKey)
                .build();

        s3.deleteObject(dor);
    }
}
