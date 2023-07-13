<%--
  Created by IntelliJ IDEA.
  User: KJJ
  Date: 2023-07-09
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
  <title>이력서 목록</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="/css/resume/list.css">
  <my:font></my:font>
</head>
<body>
  <my:navBar/>

  <br>

  <div class="container-lg">
    <div class="row justify-content-center">
      <div class="col-12 col-md-8">
            <h3 id="resumeHeader">이력서 관리</h3>
            <div class="btnBx">
                <a id="resumeWrittenBtn" href="/member/resume/write" class="wrBtn">이력서 작성</a>
            </div>
        <table class="table">
          <thead>
          <tr>
              <th>
                  <div class="tableList">
                      <div class="listSortArea">
                          <div class="col col01">이력서 제목</div>
                          <div class="col col02">이력서 관리</div>
                        </div>
                  </div>
              </th>
          </tr>
          </thead>
          <tbody class="resumeLists">
            <c:forEach items="${resumeList}" var="resume">
                <tr>
                    <td>
                        <a id="resume_${resume.resumeId}" href="/member/resume/${resume.resumeId}">${resume.title}</a>
                    </td>
                </tr>
            </c:forEach>

          </tbody>
        </table>

      </div>
    </div>
  </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="/js/member/resume/list.js"></script>
</body>
</html>
