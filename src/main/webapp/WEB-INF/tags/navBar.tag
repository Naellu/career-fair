<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="current" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- ======= Header ======= -->
<link rel="stylesheet" href="/css/navBar.css">
<%--<sec:authentication property="name" var="userId"/>--%>

<header id="header" class="header d-flex align-items-center sticked">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="/" class="logo d-flex align-items-center">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <img src="/img/main/logo.png" alt="">
            <%--            <h1>채용<span>박람회</span></h1>--%>
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li class="dropdown"><a href="/info"><span>박람회 소개</span> <i
                        class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <li><a href="/info">박람회 소개</a></li>
                        <li><a href="/location">찾아오시는길</a></li>
                    </ul>

                <li><a href="/user/join/list">참여기업</a></li>
                <li><a href="/user/posting/list">채용공고</a></li>
                <li><a href="/qna/QnaList">Q&A</a></li>

                <li class="dropdown"><a href="/customer/notice/list"><span>고객센터</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <%--                        <li><a href="#">Drop Down 1</a></li>--%>
                        <%--                        <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>--%>
                        <%--                            <ul>--%>
                        <%--                                <li><a href="#">Deep Drop Down 1</a></li>--%>
                        <%--                                <li><a href="#">Deep Drop Down 2</a></li>--%>
                        <%--                                <li><a href="#">Deep Drop Down 3</a></li>--%>
                        <%--                                <li><a href="#">Deep Drop Down 4</a></li>--%>
                        <%--                                <li><a href="#">Deep Drop Down 5</a></li>--%>
                        <%--                            </ul>--%>
                        <%--                        </li>--%>
                        <li><a href="/customer/notice/list">공지사항</a></li>
                        <li><a href="/faq">FAQ</a></li>
                    </ul>
                </li>

                <sec:authorize access="isAnonymous()">
                    <li class="dropdown"><a href="#">회원가입<i class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="/members/signup">구직자 회원가입</a></li>
                            <li><a href="/members/cosignup">기업 회원가입</a></li>
                        </ul>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li><a href="/login">로그인</a></li>
                </sec:authorize>

                <sec:authorize access="hasAuthority('user')">
                    <li><a href="/members/personal-page/mypage?id=<sec:authentication property="name" />">마이페이지</a></li>
                </sec:authorize>

                <sec:authorize access="hasAuthority('recruiter') or hasAuthority('company')">
                    <li><a href="/members/company-page/mypage?id=<sec:authentication property="name" />">마이페이지</a></li>
                </sec:authorize>

                <sec:authorize access="hasAuthority('admin')">
                    <li class="dropdown"><a href="/admin/main">관리자<i class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="/admin/main">관리자 메인</a></li>
                            <li><a href="/admin/join/list">참여기업 관리</a></li>
                            <li><a href="/admin/round">회차 관리</a></li>
                            <li><a href="/admin/stat/">통계</a></li>
                            <li><a href="/admin/management/recruitmanagement">공고관리</a></li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li><a href="/login/logout">로그아웃</a></li>
                </sec:authorize>

            </ul>

            <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
            <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
        </nav><!-- .navbar -->
    </div>
</header>
<!-- End Header -->


<%--<link rel="stylesheet" href="/css/main.css">--%>
