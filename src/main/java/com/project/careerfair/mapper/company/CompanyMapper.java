package com.project.careerfair.mapper.company;

import com.project.careerfair.domain.Company;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CompanyMapper {

    // 참여기업 신청 추가
    int insert(Company company);

    // 파일 추가
    void insertFileName(Integer companyId, String originalFilename);

    // 참여기업 목록
    List<Company> getList(Integer startNum, Integer pageSize, String search, String type, String status);

    // 참여 기업 목록 개수
    Integer countAll(String type, String search, String status);

    // 참여기업 상세
    Company getDetail(Integer companyId);

    // 참여기업상태변경
    Integer changeStatus(Integer companyId, String statusValue);

    // 유저 상태변경
    Integer changeStatusWithMemberType(Integer companyId, String statusValue);

    // 멤버 id로 기업 목록
    List<Company> getListByName(String roundValue, String memberId, Integer round);

    // 기업 id 파일이름으로 삭제
    void deleteFileNameByCompanyIdAndFileName(Integer companyId, String fileName);

    // 기업 테이블 업데이트
    int update(Company company);

    // 승인된 목록만
    List<Company> getApprovedList(Integer startNum, Integer pageSize, String search, String type, Integer industryId, Integer roundValue);

    //승인된 목록 개수세기
    Integer countApprovedList(String search, String type, Integer industryId, Integer roundValue);
}
