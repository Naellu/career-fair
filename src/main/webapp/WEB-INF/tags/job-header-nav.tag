<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header id="header" id="home">
    <div class="container">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <%--로고--%>
                <a href="/"><img src="/img/job-img/logo.png" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
<%--                    <li class="menu-active"><a href="index.html">Home</a></li>--%>
<%--                    <li><a href="about-us.html">박람회 소개</a></li>--%>
<%--                    <li><a href="category.html">Category</a></li>--%>
<%--                    <li><a href="price.html">Price</a></li>--%>
<%--                    <li><a href="blog-home.html">Blog</a></li>--%>
<%--                    <li><a href="contact.html">Contact</a></li>--%>
<%--                    <li class="menu-has-children"><a href="">Pages</a>--%>
<%--                        <ul>--%>
<%--                            <li><a href="elements.html">elements</a></li>--%>
<%--                            <li><a href="search.html">search</a></li>--%>
<%--                            <li><a href="single.html">single</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li><a class="ticker-btn" href="#">Signup</a></li>--%>
<%--                    <li><a class="ticker-btn" href="#">Login</a></li>--%>
                    <li class="dropdown"><a href="/info"><span>박람회 소개</span><i
                            class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="/info">박람회 소개</a></li>
                            <li><a href="/location">찾아오시는길</a></li>
                        </ul>

                    <li><a href="/user/join/list">참여기업</a></li>
                    <li><a href="/user/posting/list">채용공고</a></li>

                    <li class="dropdown"><a href="/customer/notice/list"><span>고객센터</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="/qna/QnaList">Q&A</a></li>
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

                    <sec:authorize access="hasAuthority('recruiter') or hasAuthority('company') or hasAuthority('admin')">
                        <li><a href="/members/company-page/mypage?id=<sec:authentication property="name" />">마이페이지</a></li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <li><a href="/login/logout">로그아웃</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasAuthority('admin')">
                        <li><a href="/admin/main">관리자</a></li>
                    </sec:authorize>
                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->