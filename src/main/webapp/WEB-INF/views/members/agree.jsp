<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2023-07-09
  Time: 오전 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>개인정보동의서</title>
  <style>
    body{
      padding: 0px 20px;
    }
    .agree-lcontainer{
      border: 1px solid black;
      top: 0;
      bottom: 0;
    }
    .agree-container{
      display: flex;
      justify-content: space-between;
      border: 1px solid black;
    }
    .agree-column{
      border: 1px solid black;
    }
    .agree-column1{
      width: 20%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .agree-column2{
      width: 80%;
    }
    .alert-column{
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid black;
    }
    .agreeclose-button{
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 7px;
      background-color: #CDCDCD;
      border-radius: 5px;
      font-size: 16px;
      font-weight: 600;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
<my:font></my:font>
    <div class="agree-lcontainer">
      <div class="agree-container">
        <div class="agree-column agree-column1"><span>수집하는 개인정보 항목</span></div>
        <div class="agree-column agree-column2">
          <div><span>-개인식별정보: 성명,생년월일,주소,전화번호,휴대전화번호,이메일</span></div>
          <div><span>-자격사항, 경력사항, 기타 위촉을 위해 본인이 작성한 관련 정보등</span></div>
        </div>
      </div>
      <div class="agree-container">
        <div class="agree-column agree-column1"><span>개인정보의 수집 및 이용목적</span></div>
        <div class="agree-column agree-column2">
          <div><span>제공하신 정보는 위촉절차의 집행 및 관리, 경력·자격 등 확인(조회 및 검증), 위촉 여부의 결정, 민원처리에 사용됩니다.</span></div>
          <div>
            <div><span>① 본인 확인 및 범죄경력 조회에 이용: 성명, 생년월일</span></div>
            <div><span>② 지원자와의 의사소통 및 정보 전달 등에 이용: 성명, 주소, 전화번호, 휴대전화번호, 이메일</span></div>
            <div><span>③ 지원자 평가에 이용: 자격사항, 경력사항 등</span></div>
            <div><span>④ 단, 지원자의 기본적인 권리 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 정치적 성향 및 범죄기록 등)는 수집하지 않습니다.</span></div>
          </div>
        </div>
      </div>
      <div class="agree-container">
        <div class="agree-column agree-column1">
          <span>개인정보의 보유 및 이용기간</span>
        </div>
        <div class="agree-column agree-column2">
          <div>
            <span>수집된 개인정보는 지원서 제출 후 위촉기간 만료 시 또는 지원서 삭제 요청 시까지 위 이용 목적을 위하여 보유·이용됩니다.
              또한 삭제 요청 시 지원자의 개인정보를 재생이 불가능한 방법으로 즉시 파기합니다.
            </span>
          </div>
        </div>
      </div>
      <div class="alert-column">
        <span>※ 귀하는 이에 대한 동의를 거부할 수 있으며, 다만, 동의가 없을경우 위촉전형 진행이 불가능할 수 있음을 알려드립니다.
        </span>
      </div>
    </div>
    <div style="display: flex; justify-content: center;">
      <span style="width:90%; margin: 10px 0px 10px 0px;">
        ※ 개인정보 제공자가 동의한 내용외의 다른 목적으로 활용하지 않으며, 제공된 개인정보의 이용을 거부하고자 할 때에는 개인정보 관리책임자를 통해 열람, 정정, 삭제를 요구할 수 있음
      </span>
    </div>
    <div style="margin-top: 10px; display: flex; justify-content: center;">
      <button class="agreeclose-button" onclick="window.close();">닫기</button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
