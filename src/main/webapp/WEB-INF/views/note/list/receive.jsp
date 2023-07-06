<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-05
  Time: 오후 1:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 쪽지함</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

</head>
<body>
<div class="container">
    <h1>받은 쪽지함</h1>
    <hr>
    ${pageInfo} <br>
    <table class="table">
        <thead>
        <tr>
            <th>보낸 사람</th>
            <th>제목</th>
            <th>받은 시간</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${noteList}" var="note" varStatus="status">

            <tr>
                <td>${note.senderId}(${note.noteId})</td>
                <td>
                    <c:url value="/note/detail" var="noteDetailURL">
                        <c:param name="noteId" value="${note.noteId}" />
                    </c:url>
                    <a href="#" onclick="openNoteWindow('${noteDetailURL}')">
                            ${note.title}
                    </a>
                </td>
                <td>${fn:replace(note.created, 'T', ' ')}</td>
                <td>
                    <button class="btn btn-outline-danger"
                            name="deleteButton"
                            data-note-id="${note.noteId}"
                    >삭제</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--페이지네이션--%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">


        <c:if test="${pageInfo.begin != 1}">

        <%--맨앞으로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="1"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-left"></i></a>
            </li>

        <%--10칸 앞으로 --%>
        <c:url value="/note/list/receive" var="pageLink">
            <c:param name="page" value="${pageInfo.previous }"></c:param>
        </c:url>
        <li class="page-item">
            <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-left"></i></a>
        </li>

        </c:if>

        <c:forEach begin="${pageInfo.begin}" end="${pageInfo.end}" var="page">
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${page }"></c:param>
            </c:url>
            <li class="page-item ${page eq param.page ? 'active' : ''}">
                <a class="page-link" href="${pageLink}">${page}</a>
            </li>
        </c:forEach>


        <c:if test="${pageInfo.end != pageInfo.last}">

        <%--10칸 뒤로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageInfo.next }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-right"></i></a>
            </li>

        <%--맨 뒤로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageInfo.last }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-right"></i></a>
            </li>

        </c:if>
    </ul>
</nav>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/js/Note/list.js"></script>

</body>
</html>

