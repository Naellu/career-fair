<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="current"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg mb-5">
    <div class="container-lg">
        <a class="navbar-brand me-5" href="#">
            <span>채용박람회</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item me-3">
                    <a class="nav-link ${current eq 'exhibitionInfo' ? 'active' : '' }" href="#" >박람회 소개</a>
                </li>

                <li class="nav-item me-3">
                    <a class="nav-link ${current eq 'conpanies' ? 'active' : '' }" href="#" >참여기업</a>
                </li>

                <li class="nav-item me-3">
                    <a class="nav-link ${current eq 'posting' ? 'active' : '' }" href="#" >채용공고</a>
                </li>

                <li class="nav-item me-3">
                    <a class="nav-link ${current eq 'qna' ? 'active' : '' }" href="#" >Q&A</a>
                </li>

            </ul>
            <ul class="navbar-nav">

                    <li class="nav-item me-3">
                        <a class="nav-link ${current eq 'signup' ? 'active' : '' }" href="#">회원가입</a>
                    </li>

                    <li class="nav-item me-3">
                        <a class="nav-link ${current eq 'login' ? 'active' : '' }" href="#" >로그인</a>
                    </li>

                    <li class="nav-item me-3">
                        <a class="nav-link ${current eq 'mypage' ? 'active' : '' }" href="#">마이페이지</a>
                    </li>

                    <li class="nav-item me-3">
                        <a class="nav-link ${current eq 'support' ? 'active' : '' }" href="#">관리자</a>
                    </li>

<%--                    <li class="nav-item me-3">--%>
<%--                        <a class="nav-link" href="/member/logout">로그아웃</a>--%>
<%--                    </li>--%>

            </ul>

        </div>
    </div>
</nav>


<link rel="stylesheet" href="/css/navBar.css">