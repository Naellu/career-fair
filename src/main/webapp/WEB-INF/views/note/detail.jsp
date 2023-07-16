<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${noteInfo.title}</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 600px;
        }

        .text-center {
            text-align: center;
        }
    </style>

</head>
<body>
<my:font/>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <h5 class="mb-3">${noteInfo.title}</h5>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <c:choose>
                    <c:when test="${distinction eq 'receive'}">
                        <input type="text" readonly class="form-control-plaintext" id="staticSender"
                               value="${noteInfo.senderId}">
                    </c:when>
                    <c:when test="${distinction eq 'send'}">
                        <input type="text" readonly class="form-control-plaintext" id="staticSender"
                               value="${noteInfo.recipientId}">
                    </c:when>
                    <c:otherwise/>
                </c:choose>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <input type="text" readonly class="form-control-plaintext" id="staticCreated"
                       value="${fn:replace(noteInfo.created, 'T', ' ')}">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-10">
            <div class="form-group">
                <textarea readonly class="form-control" id="staticContent" rows="5" style="background-color: white">${noteInfo.content}</textarea>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10">
            <div class="text-right">
                <c:choose>
                    <c:when test="${distinction eq 'receive'}">
                        <c:url value="/note/write" var="writeNoteURL">
                            <c:param name="senderId" value="${noteInfo.recipientId}"/>
                            <c:param name="recipientId" value="${noteInfo.senderId}"/>
                        </c:url>
                        <button type="button" class="btn btn-outline-primary" onclick="writeNote('${writeNoteURL}')">
                            답장하기
                        </button>
                    </c:when>
                    <c:when test="${distinction eq 'send'}">
                        <c:url value="/note/write" var="writeNoteURL">
                            <c:param name="senderId" value="${noteInfo.senderId}"/>
                            <c:param name="recipientId" value="${noteInfo.recipientId}"/>
                            <c:param name="title" value="${noteInfo.title}"/>
                            <c:param name="content" value="${noteInfo.content}"/>
                        </c:url>
                        <button type="button" class="btn btn-outline-primary" onclick="writeNote('${writeNoteURL}')">
                            재전송
                        </button>
                    </c:when>
                    <c:otherwise/>
                </c:choose>
                <button type="button" class="btn btn-outline-secondary" onclick="window.close()">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="/js/note/list.js"></script>

</body>
</html>
