<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <my:font></my:font>
    <title>채용공고</title>
    <style>
        #posting-container a {
            text-decoration: none;
            color: black;
        }

        #posting-container a:hover {
            color: #00b6a1;
            text-decoration: none;
        }
    </style>
</head>
<body>
<my:navBar/>

<my:cheader>
    채 용 공 고
</my:cheader>
<form id="filter-form" method="GET">
    <div class="container-lg mt-3">
        <div class="accordion" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne"
                            aria-expanded="true"
                            aria-controls="collapseOne">
                        필터링하기
                    </button>
                </h2>

                <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <div class="row">
                                    <div class="col border-secondary border-end">
                                        <h5>업종</h5>
                                        <div id="industry-container"></div>
                                    </div>
                                    <div class="col border-secondary border-end">
                                        <h5>경력</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox" value="신입">
                                            <label class="form-check-label">
                                                신입
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox" value="경력">
                                            <label class="form-check-label">
                                                경력
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="experienceLevels" type="checkbox"
                                                   value="경력무관">
                                            <label class="form-check-label">
                                                경력무관
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col border-secondary border-end">
                                        <h5>학력</h5>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="대학원이상">
                                            <label class="form-check-label">
                                                대학원이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox" value="대졸이상">
                                            <label class="form-check-label">
                                                대졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox"
                                                   value="초대졸이상">
                                            <label class="form-check-label">
                                                초대졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox" value="고졸이상">
                                            <label class="form-check-label">
                                                고졸이상
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" name="educationLevels" type="checkbox" value="학력무관">
                                            <label class="form-check-label">
                                                학력무관
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col">
                                <h5>채용형태</h5>
                                <div class="form-check">
                                    <input class="form-check-input" name="employmentTypes" type="checkbox" value="정규직">
                                    <label class="form-check-label">
                                        정규직
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" name="employmentTypes" type="checkbox" value="계약직">
                                    <label class="form-check-label">
                                        계약직
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" name="employmentTypes" type="checkbox" value="인턴">
                                    <label class="form-check-label">
                                        인턴
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-end mt-2">
            <div>
                <div class="input-group">
                    <select name="type" class="form-select flex-grow-0" style="width: 120px;">
                        <option value="all">전체</option>
                        <option ${param.type eq 'companyName'? 'selected' : ''} value="companyName">기업명</option>
                        <option ${param.type eq 'title'? 'selected' : ''} value="title">공고명</option>
                        <option ${param.type eq 'address'? 'selected' : ''} value="address">지역</option>
                    </select>
                    <input name="search" value="${param.search}" class="form-control" type="search" placeholder="Search"
                           aria-label="Search">
                    <button id="search-btn" class="btn btn-outline-success" type="submit">
                        검색
                    </button>
                    <c:if test="${not empty param}">
                        <div class="ms-3">
                            <button class="btn btn-outline-danger" type="button" id="cancel-search-btn">
                                <i class="fa-solid fa-x"></i>
                            </button>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="container-lg mt-3 mb-5">
    <table id="posting-container" class="table fs-5 table-bordered table-striped">
        <tbody>
        </tbody>
    </table>
</div>

<div class="container-lg">
    <div class="row">
        <nav aria-label="Page navigation example">
            <ul id="page-ul" class="pagination justify-content-center">
            </ul>
        </nav>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/js/user/posting/list.js"></script>
</body>
</html>