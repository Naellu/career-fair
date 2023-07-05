<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-05
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 쪽지함</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<div class="container">
    <h1>받은 쪽지함(${userId}님)</h1>
    <table class="table">
        <thead>
        <tr>
            <th>보낸 사람</th>
            <th>내용</th>
            <th>보낸 시간</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${noteList}" var="note">

        <tr>
            <td>${note.senderId}</td>
            <td>${note.title}</td>
            <td>${fn:replace(note.created, 'T', ' ')}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--페이지네이션--%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">

        <%--맨앞으로--%>
        <li class="page-item disabled">
            <span class="page-link">
                <i class="fa-solid fa-angles-left"></i>
            </span>
        </li>

        <%--이전 페이지--%>
        <li class="page-item disabled">
            <span class="page-link">
                <i class="fa-solid fa-angle-left"></i>
            </span>
        </li>

        <c:forEach>


        </c:forEach>
        <%--다음 페이지--%>
        <li class="page-item disabled">
            <span class="page-link">
                <i class="fa-solid fa-angle-right"></i>
            </span>

        </li>

        <%--맨 뒤로--%>
        <li class="page-item disabled">
            <span class="page-link">
                <i class="fa-solid fa-angles-right"></i>
            </span>
        </li>
    </ul>
</nav>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>

