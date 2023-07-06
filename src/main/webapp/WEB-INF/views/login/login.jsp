<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-07-06
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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

</body>
</html>
