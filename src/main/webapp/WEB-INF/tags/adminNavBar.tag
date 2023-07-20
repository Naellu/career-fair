<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="current"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- ======= Header ======= -->
<link rel="stylesheet" href="/css/navBar.css">

<%--<sec:authorize access="hasAuthority('admin')">--%>
<header id="header" class="header d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="/admin/main">관리자 메인</a></li>
                <li><a href="/">메인</a></li>
                <li><a href="/admin/recruiter/list">참여기업</a></li>
                <li><a href="#">Q&A</a></li>
                <li><a href="/customer/notice/list">공지사항</a></li>
                <li><a href="/admin/round">회차관리</a></li>
                <li><a href="/stat">통계</a></li>

                <sec:authorize access="isAnonymous()">
                    <li><a href="/login/login">로그인</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li><a href="/login/logout">로그아웃</a></li>
                </sec:authorize>
            </ul>
        </nav>
    </div>
</header>
<%--</sec:authorize>--%>
