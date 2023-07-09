<%--
  Created by IntelliJ IDEA.
  User: KJJ
  Date: 2023-07-09
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <my:font></my:font>
</head>
<body>
    <my:navBar/>

    <div class="container col-lg-5">
        <h2 class="mt-4">이력서 등록</h2>

        <!-- 이력서 제목 입력칸 -->
        <div class="form-group mb-3">
            <h4>이력서 제목</h4>
            <input type="text" class="form-control" id="title" placeholder="이력서 제목을 입력해주세요">
        </div>

        <!-- 인적사항 그룹 -->
        <div class="form-group mb-3">
            <h4>인적사항</h4>
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" id="name" placeholder="이름">
                </div>
                <div class="col">
                    <input type="date" class="form-control" id="birth" placeholder="생년월일">
                </div>
                <div class="col">
                    <select class="form-control" id="gender">
                        <option selected>성별</option>
                        <option>남성</option>
                        <option>여성</option>
                    </select>
                </div>
            </div>
            <input type="text" class="form-control mt-2" id="phone" placeholder="전화번호">
            <input type="email" class="form-control mt-2" id="email" placeholder="이메일">
            <input type="text" class="form-control mt-2" id="address" placeholder="주소">
        </div>

        <!-- 경력 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>경력</h4>
            <div id="careerContainer">
                <div class="careerGroup">
                    <div class="row">
                        <input type="hidden" class="form-control careerId" id="careerId1">
                        <div class="col">
                            <label for="companyName1">회사명</label>
                            <input type="text" class="form-control companyName" id="companyName1" placeholder="">
                        </div>
                        <div class="col">
                            <label for="startDate1">입사일</label>
                            <input type="text" class="form-control startDate" id="startDate1" placeholder="YYYY-MM-DD">
                        </div>
                        <div class="col">
                            <label for="endDate1">퇴사일</label>
                            <input type="text" class="form-control endDate" id="endDate1" placeholder="YYYY-MM-DD">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <input type="text" class="form-control position" id="position1" placeholder="직위">
                        </div>
                        <div class="col">
                            <input type="text" class="form-control task" id="task1" placeholder="담당업무">
                        </div>
                    </div>
                    <input type="text" class="form-control others" id="others1" placeholder="기타설명">
                </div>
            </div>
            <button type="button" class="btn btn-dark mt-3" id="addCareerButton">경력 추가</button>
        </div>

        <!-- 학력 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>학력</h4>
            <select class="form-control" id="educationType">
                <option selected>학력 종류</option>
                <option>고등학교</option>
                <option>대학 2년제</option>
                <option>대학 4년제</option>
            </select>
            <input type="text" class="form-control" id="schoolName" placeholder="학교명">
            <input type="text" class="form-control" id="major" placeholder="학과">
            <input type="date" class="form-control" id="enterDate" placeholder="입학일">
            <input type="date" class="form-control" id="gradDate" placeholder="졸업일">
            <select class="form-control" id="gradStatus">
                <option selected>졸업 상태</option>
                <option>졸업</option>
                <option>휴학</option>
                <option>재학</option>
                <option>중퇴</option>
            </select>
            <button type="button" class="btn btn-dark mt-2">학력 추가</button>
        </div>

        <!-- 자격증 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>자격증</h4>
            <div class="row">
                <div class="col">
                    <label for="certName">종류</label>
                    <input type="text" class="form-control" id="certName" placeholder="">
                </div>
                <div class="col">
                    <label for="acquisitionDate">취득일</label>
                    <input type="text" class="form-control" id="acquisitionDate" placeholder="YYYY-MM-DD">
                </div>
                <div class="col">
                    <label for="acquisitionDate">발급기간</label>
                    <input type="text" class="form-control" id="validity" placeholder="">
                </div>
            </div>
            <button type="button" class="btn btn-dark mt-3">자격증 추가</button>
        </div>

        <!-- 희망근무조건 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>희망근무조건</h4>
            <input type="text" class="form-control" id="desiredLocation" placeholder="근무지역">
            <input type="number" class="form-control" id="desiredSalary" placeholder="연봉">
            <select class="form-control" id="employmentType">
                <option selected>고용형태</option>
                <option>정규직</option>
                <option>계약직</option>
            </select>
        </div>


        <!-- 병역여부 그룹 -->
        <div class="form-group mb-3">
            <h4>병역여부</h4>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="militaryService" id="militaryService1" value="notRequired">
                <label class="form-check-label" for="militaryService1">미필</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="militaryService" id="militaryService2" value="completed">
                <label class="form-check-label" for="militaryService2">군필</label>
            </div>
            <div class="form-check disabled">
                <input class="form-check-input" type="radio" name="militaryService" id="militaryService3" value="notApplicable">
                <label class="form-check-label" for="militaryService3">해당사항 없음</label>
            </div>
            <select class="form-control" id="militaryRank" disabled>
                <option selected>병급 선택</option>
                <option>이병</option>
                <option>일병</option>
                <option>상병</option>
                <option>병장</option>
            </select>
        </div>

        <!-- 자기소개 입력칸 -->
        <div class="form-group mb-3">
            <h4>자기소개</h4>
            <textarea class="form-control" id="selfIntroduction" rows="3"></textarea>
        </div>

        <!-- 희망업종 선택칸 -->
        <div class="form-group mb-3">
            <h4>희망업종</h4>
            <input type="text" class="form-control" id="desiredJob" placeholder="희망업종을 입력해주세요">
        </div>

        <button type="submit" class="btn btn-success" id="submitResumeButton">등록하기</button>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/js/member/resume/write.js"></script>
</body>
</html>
