<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-06
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>--%>
<%@ page import="java.util.*"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<%--    <my:font></my:font>--%>
    <title>Title</title>
</head>
<body>
<div class="container-lg flex-grow-1">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <h1>로그인</h1>
            <form method="post">
                <div class="mb-3">
                    <label for="inputUsername" class="form-label"> 아이디</label> <input id="inputUsername"
                                                                                      class="form-control" type="text"
                                                                                      name="username"/>
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">암호</label> <input id="inputPassword"
                                                                                    class="form-control" type="password"
                                                                                    name="password"/>
                </div>
                <div class="col-lg-6">
                    <input class="btn btn-primary loginbutton" type="submit" value="로그인"/>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
