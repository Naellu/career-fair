<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="current"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- ======= Header ======= -->

<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="/" class="logo d-flex align-items-center">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <img src="/img/main/logo.png" alt="">
<%--            <h1>채용<span>박람회</span></h1>--%>
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li><a href="#">박람회 소개</a></li>
                <li><a href="#">참여기업</a></li>
                <li><a href="#">채용공고</a></li>
                <li><a href="#">Q&A</a></li>

                <li class="dropdown"><a href="#"><span>고객센터</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
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

                <li><a href="#">회원가입</a></li>


                <sec:authorize access="isAnonymous()">
                    <li><a href="/login/login">로그인</a></li>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <li><a href="/login/logout">로그아웃</a></li>
                </sec:authorize>
            </ul>
        </nav><!-- .navbar -->

        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
</header><!-- End Header -->
<!-- End Header -->


<link rel="stylesheet" href="/css/main.css">