<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<body onload="setDate()">

<div class="container mt-5">
    <h2>채용공고 등록 - ${company.companyName}</h2>
    <form action="/posting/add" method="POST">
        <div class="mb-3">
            <label for="companyId" class="form-label">회사 ID</label>
            <input type="text" class="form-control" id="companyId" name="companyId" value="${company.companyId}"
                   required>
        </div>
        <div class="mb-3">
            <label for="round" class="form-label">라운드</label>
            <input type="text" class="form-control" id="round" name="round" value="${company.round}" required>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="industryId" class="form-label">산업 ID</label>
            <select class="form-control" id="industryId" name="industryId" required>
                <c:forEach items="${industryList}" var="industry">
                    <option value="${industry.industryId}" ${company.industryId == industry.industryId} ?
                    'selected' : ''} >
                    ${industry.industryName}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="hiringCount" class="form-label">채용 인원 수</label>
            <input type="number" class="form-control" id="hiringCount" name="hiringCount" required>
        </div>
        <div class="mb-3">
            <label for="spareCount" class="form-label">예비 인원 수</label>
            <input type="number" class="form-control" id="spareCount" name="spareCount" required>
        </div>
        <div class="mb-3">
            <label for="startDate" class="form-label">시작일</label>
            <input type="date" class="form-control" id="startDate" name="startDate" min="" required>
        </div>
        <div class="mb-3">
            <label for="endDate" class="form-label">종료일</label>
            <input type="date" class="form-control" id="endDate" name="endDate" min="" required>
        </div>
        <div class="mb-3">
            <label for="status" class="form-label">상태</label>
            <input type="text" class="form-control" id="status" name="status" value="채용중" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">주소</label>
            <input type="text" class="form-control" id="address" name="address"
                   value="${company.address}, ${company.detailAddress}" required>
        </div>
        <div class="mb-3">
            <label for="salary" class="form-label">급여</label>
            <input type="text" class="form-control" id="salary" name="salary" required>
        </div>
        <div class="mb-3">
            <label for="preferences" class="form-label">우대사항</label>
            <textarea class="form-control" id="preferences" name="preference" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="benefits" class="form-label">혜택</label>
            <textarea class="form-control" id="benefits" name="benefit" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="requirements" class="form-label">자격 요건</label>
            <textarea class="form-control" id="requirements" name="requirement" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="etc" class="form-label">기타</label>
            <textarea class="form-control" id="etc" name="etc" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="employmentType" class="form-label">고용 형태</label>
            <select class="form-control" id="employmentType" name="employmentType" required>
                <option value="정규직" selected >정규직</option>
                <option value="계약직">계약직</option>
                <option value="인턴">인턴</option>
            </select>

        </div>
        <div class="mb-3">
            <label for="experienceLevel" class="form-label">경력 요건</label>
            <select class="form-control" id="experienceLevel" name="experienceLevel" required>
                <option value="무관" selected >무관</option>
                <option value="신입">신입</option>
                <option value="경력">경력</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="educationLevel" class="form-label">학력 요건</label>
            <select class="form-control" id="educationLevel" name="educationLevel" required>
                <option value="무관" selected >무관</option>
                <option value="고졸이상">고졸이상</option>
                <option value="초대졸이상">초대졸이상</option>
                <option value="대졸이상">대졸이상</option>
                <option value="대학원이상">대학원이상</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">등록</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"
        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/posting/add.js"></script>

</body>
</html>