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

    <title>이력서 작성</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/resume/resume.css">
    <my:font></my:font>
</head>
<body>
    <my:navBar/>

    <div class="container col-lg-5">
        <h2 class="mt-4" id="resumeMain">이력서 등록</h2>

        <!-- 이력서 제목 입력칸 -->
        <div class="form-group mb-3">
            <h4>이력서 제목</h4>
            <input type="text" class="form-control" id="resumeTitle" placeholder="이력서 제목을 입력해주세요">
        </div>

        <!-- 인적사항 그룹 -->
        <h4>인적사항</h4>
        <div id="memberInfoContainer" class="inputContainer">
            <div class="form-group mb-3 memberInfoGroup inputDetailGroup">
                <div class="row">
                    <div class="col">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" placeholder="">
                    </div>
                    <div class="col">
                        <label for="birth">생년월일</label>
                        <input type="date" class="form-control" id="birth" placeholder="">
                    </div>
                    <div class="col">
                        <label for="gender">성별</label>
                        <select class="form-control" id="gender">
                            <option selected disabled></option>
                            <option>남성</option>
                            <option>여성</option>
                        </select>
                    </div>
                </div>
                <label for="phone">전화번호</label>
                <input type="text" class="form-control mt-2" id="phone" placeholder="">
                <label for="email">이메일</label>
                <input type="email" class="form-control mt-2" id="email" placeholder="">
                <label for="address">주소</label>
                <input type="text" class="form-control mt-2" id="address" placeholder="">
            </div>
        </div>


        <!-- 경력 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>경력</h4>
            <div id="careerContainer" class="inputContainer">
                <div class="careerGroup inputDetailGroup">
                    <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                    <input type="hidden" class="form-control careerId" id="careerId1">
                    <div class="row">
                        <div class="col">
                            <label for="companyName1">회사명</label>
                            <input type="text" class="form-control companyName" id="companyName1" placeholder="">
                        </div>
                        <div class="col">
                            <label for="startDate1">입사일</label>
                            <input type="text" class="form-control entryDate" id="startDate1" placeholder="YYYY-MM-DD">
                        </div>
                        <div class="col">
                            <label>퇴사일</label>
                            <input type="text" class="form-control resignationDate" id="resignationDate1" placeholder="YYYY-MM-DD">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label for="position1">직위</label>
                            <input type="text" class="form-control position" id="position1" placeholder="">
                        </div>
                        <div class="col">
                            <label for="task1">담당업무</label>
                            <input type="text" class="form-control task" id="task1" placeholder="">
                        </div>
                    </div>
                    <label for="description1">기타설명</label>
                    <input type="text" class="form-control description" id="description1" placeholder="">
                </div>
            </div>
            <div class="addBtnDiv">
                <button type="button" class="btn btn-dark mt-3" id="addCareerButton">경력 추가</button>
            </div>
        </div>

        <!-- 학력 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>학력</h4>
            <div id="educationContainer" class="inputContainer">
                <div class="educationGroup inputDetailGroup">
                    <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                    <div class="row">
                        <div class="col">
                            <label for="educationType">학력</label>
                            <select class="form-control educationType" id="educationType">
                                <option selected disabled></option>
                                <option>고졸</option>
                                <option>전문대졸</option>
                                <option>대졸</option>
                                <option>대학원졸(석사)</option>
                                <option>대학원졸(박사)</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="schoolName">학교명</label>
                            <input type="text" class="form-control schoolName" id="schoolName" placeholder="">
                        </div>
                        <div class="col">
                            <label for="enterDate">입학일</label>
                            <input type="date" class="form-control enterDate" id="enterDate" placeholder="">
                        </div>
                        <div class="col">
                            <label for="gradDate">졸업일</label>
                            <input type="date" class="form-control gradDate" id="gradDate" placeholder="">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label for="major">학과</label>
                            <input type="text" class="form-control major" id="major" placeholder="">
                        </div>
                        <div class="col">
                            <label for="gradStatus">졸업상태</label>
                            <select class="form-control form-selected gradStatus" id="gradStatus">
                                <option selected disabled></option>
                                <option>졸업</option>
                                <option>휴학</option>
                                <option>재학</option>
                                <option>중퇴</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="addBtnDiv">
                <button type="button" class="btn btn-dark mt-2" id="addEducation">학력 추가</button>
            </div>
        </div>

        <!-- 자격증 입력 그룹 -->
        <div class="form-group mb-3">
            <h4>자격증</h4>
            <div id="certificationContainer" class="inputContainer">
                <div class="certificationGroup inputDetailGroup">
                    <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                    <div class="row">
                        <div class="col">
                            <label>종류</label>
                            <input type="text" class="form-control certificationName" id="certificationName1" placeholder="">
                        </div>
                        <div class="col">
                            <label>취득일</label>
                            <input type="text" class="form-control getDate" id="getDate1" placeholder="YYYY-MM-DD">
                        </div>
                        <div class="col">
                            <label>발급기관</label>
                            <input type="text" class="form-control organization" id="organization1" placeholder="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="addBtnDiv">
                <button type="button" class="btn btn-dark" id="addCertification">자격증 추가</button>
            </div>
        </div>

        <!-- 희망근무조건 입력 그룹 -->
        <h4>희망근무조건</h4>
        <div id="desiredConditionContainer" class="inputContainer">
            <div class="form-group mb-3 desiredConditionGroup inputDetailGroup">
                <div id="workAreaContainer">
                    <label for="desiredLocation1">근무지역</label>
                    <input type="text" class="form-control desiredLocation" id="desiredLocation1" placeholder="">
                </div>
                <button type="button" class="btn btn-dark mt-2 addBtnDiv" id="addWorkArea">근무지역 추가</button>
                <label for="desiredSalary">연봉</label>
                <input type="text" class="form-control desiredSalary" id="desiredSalary" placeholder="">
                <label for="employmentType">고용형태</label>
                <select class="form-control" id="employmentType">
                    <option selected disabled></option>
                    <option>정규직</option>
                    <option>계약직</option>
                </select>
            </div>
        </div>


        <!-- 병역여부 그룹 -->
        <div class="form-group mb-3">
            <h4>병역여부</h4>
            <div class="inputContainer">
                <div class="inputDetailGroup">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="militaryService" id="unfulfilled" value="미필">
                        <label class="form-check-label" for="unfulfilled">미필</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="militaryService" id="fulfilled" value="fulfilled">
                        <label class="form-check-label" for="fulfilled">군필</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="militaryService" id="notApplicable" value="해당사항없음">
                        <label class="form-check-label" for="notApplicable">해당사항없음</label>
                    </div>
                    <select class="form-select militaryRank" id="militaryRank">
                        <option selected disabled>병급 선택</option>
                        <option>이병</option>
                        <option>일병</option>
                        <option>상병</option>
                        <option>병장</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- 자기소개 입력칸 -->
        <div class="form-group mb-3">
            <h4>자기소개</h4>
            <textarea class="form-control" id="selfIntroduction" rows="3"></textarea>
        </div>

        <!-- 희망업종 선택칸 -->
        <div class="form-group mb-3">
            <h4>희망업종</h4>
            <select class="form-select" id="desiredIndustry">
                <c:forEach var="industry" items="${industry}" >
                    <option value="${industry.industryId}">${industry.industryName}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-success" id="submitResumeButton">등록하기</button>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/js/member/resume/write.js"></script>
</body>
</html>
