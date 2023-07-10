package com.project.careerfair.mapper.company;

import com.project.careerfair.domain.Company;
import com.project.careerfair.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CompanyMapper {

    // 참여기업 신청 추가
    int insert(Company company);

    // 파일 추가
    void insertFileName(Integer companyId, String originalFilename);

    // 참여기업 목록
    List<Notice> getList(Integer startNum, Integer pageSize, String search, String type, String status);

    // 참여 기업 목록 개수
    Integer countAll(String type, String search, String status);

    Company getDetail(Integer companyId);

    Integer changeStatus(Integer companyId, String statusValue);

    Integer changeStatusWithMemberType(Integer companyId, String statusValue);

    List<Company> getListByName(String roundValue, String memberId, Integer round);

    void deleteFileNameByCompanyIdAndFileName(Integer companyId, String fileName);

    int update(Company company);

}
