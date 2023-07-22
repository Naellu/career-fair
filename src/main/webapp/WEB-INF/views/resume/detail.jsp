<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-13
  Time: 오전 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>이력서 상세</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/css/resume/detail.css">
    <my:font></my:font>

</head>
<body>
<my:navBar/>

<div class="container resume-view-container">

    <div class="resumeHeader"></div>

    <!-- 이력서 제목 -->
    <div class="form-group mb-3 resumeTitleDiv">
        <div class="resume-subject">${resumeData.title}</div>
        <div>
<%--            <button type="submit" class="btn btn-outline-dark" id="getResumeUpdate" value="${resumeData.resumeId}">수정</button>--%>
            <a href="/resume/${resumeData.resumeId}/update" id="updateResume" class="pr-5">수정</a>
            <a href="/resume/" id="moveToList">목록</a>
        </div>
    </div>

    <%--  인적사항  --%>
    <div class="base profile">
        <div class="container">
            <div class="info-container">
                <div class="info-general">
                    <div class="item name">${memberInfo.name}</div>
                    <div class="item sex">${memberInfo.gender}</div>
<%--                    <div class="item year">1998년 </div>--%>
<%--                    <div class="item age">(만 25세)</div>--%>
                </div>
                <div class="info-detail">
                    <div class="item">
                        <div class="label">휴대폰</div>
                        <div class="value">${memberInfo.phoneNumber}</div>
                    </div>
                    <div class="item">
                        <div class="label">Email</div>
                        <div class="value">
                            <a href="mailto:${memberInfo.email}">${memberInfo.email}</a>
                        </div>
                    </div>
                    <div class="item item-full">
                        <div class="label">주소</div>
                        <div class="value">${memberInfo.address}</div>
                    </div>


                </div>
            </div>
        </div>

    </div>


    <%-- 경력 --%>
    <div class="base career">
        <div class="headers">
            <h4 class="">경력</h4>
        </div>
        <div class="list list-career">
            <c:forEach var="career" items="${resumeData.careers}">
                <div class="item careerItem">
                    <div class="date">
                        <div class="term">${career.entryDate} ~ ${career.resignationDate}</div>
<%--                        <div class="term-calculator">2개월</div>--%>
                    </div>
                    <div class="content careerContent">
                        <div class="content-header">
                            <div class="name companyName">${career.companyName}</div>
                            <div class="is-private"></div>
                            <div class="position">${career.position}</div>
                        </div>
                        <div class="content-body">
                            <div class="description">${career.description}</div>
                            <div class="info">
                                <div class="item">
                                    <div class="label">연봉</div>
                                    <div class="value">
                                        222만원
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="label">주요직무</div>
                                    <div class="value">${career.task}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </c:forEach>
        </div>
    </div>

    <!-- 학력 -->
    <div class="base education">
        <div class="headers">
            <h4 class="">학력</h4>
        </div>
        <div class="list list-education">
            <c:forEach var="education" items="${resumeData.educations}">
                <div class="item educationItem">
                    <div class="date">
                        <div class="term">${education.entryDate} ~ ${education.graduationDate}</div>
                        <div class="state">${education.status}</div>
                    </div>
                    <div class="content educationContent">
                        <div class="content-header">
                            <div class="name schoolName">${education.schoolName}</div>
                            <div class="line major">${education.major}</div>
                        </div>
                        <div class="content-body">
                            <div class="info">
                                <div class="item">
                                    <div class="label">학점</div>
                                    <div class="value">3.5 / 4.5</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 자격증 -->
    <div class="base certificate">
        <div class="headers">
            <h4 class="">자격증</h4>
        </div>
        <div class="list list-certificate">
            <c:forEach var="certification" items="${resumeData.certifications}">
                <div class="item pdf-page-break">
                    <div class="date">${certification.getDate}</div>
                    <div class="content">
                        <div class="content-header">
                            <div class="name certificationName">${certification.certificationName}</div>
                            <div class="agency organization">${certification.organization}</div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 희망근무조건 -->
    <div class="base hopework" id="js-hopeworkAnchor">
        <div class="headers">
            <h4 class="">희망근무조건</h4>
        </div>
        <table class="table table-hopework">
<%--            <caption><span class="skip">희망근무조건</span></caption>--%>
            <tbody>
            <tr>
                <th scope="row">고용형태</th>
                <td>${resumeData.workCondition.employmentType}</td>
            </tr>
            <tr>
                <th scope="row">희망근무지</th>
                <td>
                    <c:forEach var="workArea" items="${resumeData.workAreas}">
                        <span>${workArea.hopedWorkArea}</span>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th scope="row">희망연봉</th>
                <td>${resumeData.workCondition.salary}만원 이상</td>
            </tr>
<%--            <tr>--%>
<%--                <th scope="row">지원분야</th>--%>
<%--                <td>--%>
<%--                    <div class="content is-label">--%>
<%--                        <div class="item">--%>
<%--                            <div class="label">업종</div>--%>
<%--                            <div class="value">--%>
<%--                                <ul class="list-hopework">--%>
<%--                                    <li>--%>
<%--                                        <div class="item">백엔드개발자</div>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--            </tr>--%>
            </tbody>
        </table>
    </div>


    <!-- 병역여부 -->
    <div class="base certificate">
        <div class="headers">
            <h4 class="">병역여부</h4>
        </div>
        <div class="list list-certificate list-military">
            <div class="item pdf-page-break">
                <div class="date">테스트</div>
                <div class="content">
                    <div class="content-header">
                        <div class="name certificationName">${resumeData.military}</div>
<%--                        <div class="agency organization">${certification.organization}</div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 자기소개 -->
    <div class="form-group mb-3">
        <div class="headers">
            <h4 class="">자기소개</h4>
        </div>
        <div class="form-group" id="${resumeData.resumeId}">${resumeData.intro}</div>
    </div>

    <!-- 희망업종 -->
    <div class="base certificate">
        <div class="headers">
            <h4 class="">희망업종</h4>
        </div>
        <div class="list list-certificate list-industry">
            <div class="item pdf-page-break">
                <div class="date">테스트</div>
                <div class="content">
                    <div class="content-header">
                        <div class="name" id="${resumeData.industryId}">${resumeData.industryId}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="sign">
        <div class="message">위의 모든 기재사항은 사실과 다름없음을 확인합니다.</div>

        <div class="writer">작성자 : ${memberInfo.name}</div>
        <div class="warning">
            <div class="description">이 이력서는
                <span id="last-updated">
                    ${empty resumeData.lastUpdated ? resumeData.created : resumeData.lastUpdated}
                </span>
                에 최종 수정된 이력서 입니다.
                <br>위조된 문서를 등록하여 취업활동에 이용 시 법적 책임을 지게 될 수 있습니다.
                <br>중앙 취업 박람회은/는 구직자가 등록 한 문서에 대해 보증하거나 별도의 책임을 지지 않으며
                <br>첨부된 문서를 신뢰하여 발생한 법적 분쟁에 책임을 지지 않습니다.
                <br>또한 구인/구직 목적 외  다른 목적으로 이용시 이력서 삭제 혹은 비공개 조치가 될 수 있습니다.
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/resume/detail.js"></script>

</body>
</html>
