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


<%--  <div class="tableList">--%>
<%--    <a href="/member/resume/write" class="getWriteResume">이력서 작성</a>--%>
<%--    <div class="container">--%>
<%--      <div class="listSortArea">--%>
<%--        <div class="col col01">이력서 제목</div>--%>
<%--        <div class="col col02">이력서 관리</div>--%>
<%--      </div>--%>
<%--      <div class="mtuList">--%>
<%--        <ul>--%>
<%--          <li class="chk">--%>
<%--            <div class="col col01">--%>
<%--              <div class="tit">--%>
<%--                <em class="badge badge_box_point">기본이력서</em>--%>
<%--                <a href="/User/Resume/View?rNo=24527195" target="_blank">희망을 꿈꾸는 백엔드 개발자 김재정입니다</a>--%>
<%--              </div>--%>
<%--              <div class="date">2023.07.02</div>--%>

<%--              <div class="positionOffer">--%>
<%--                <button type="button" class="btnPositionOffer dev-btn-open-setting" aria-haspopup="dialog" title="포지션 제안 설정">--%>
<%--                  <span>포지션 제안 받지 않는 중 (2023.07.02 16:40~)</span>--%>
<%--                </button>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <div class="col col02">--%>

<%--              <div class="btnCell"><a class="btn btnTopBooth " href="/User/ResumeBuy" onclick="GA_Event('이력서관리_PC', '이력서현황', '이력서 강조상품 신청')">이력서 강조상품 신청</a></div>--%>

<%--              <div class="btnCell"><a class="btn" href="/User/Resume/Edit?RNo=24527195" target="_blank">수정</a></div>--%>
<%--              <div class="btnCell">--%>
<%--                <div class="mtuMoreMenu">--%>
<%--                  <button class="btn btnMore mtuSpImgBefore" type="button"><span class="skip">서비스 더보기</span></button>--%>
<%--                  <div class="mtuLyWrap lyMoreMenu devMtuLyWrap" style="display: none;">--%>
<%--                    <div class="lyCnt">--%>
<%--                      <ul>--%>
<%--                        <li><a href="/User/ResumeMng/ResumeCopy?RNo=24527195">복사</a></li>--%>
<%--                        <li><a href="/User/Resume/Print?RNo=24527195" onclick="fncResumePrint(this.href); return false;">인쇄</a></li>--%>
<%--                        <li><a href="/User/Resume/ExportToWord?RNo=24527195" onclick="fncWordResumeDown(this.href); return false;">MS워드 보기</a></li>--%>
<%--                        <li><a href="javascript:" onclick="fncPdfResumeDown(24527195); return false;">PDF 보기</a></li>--%>
<%--                        <li><a href="javascript:" class="button-send-email" index="1">메일전송/내역조회</a></li>--%>
<%--                        <li><a href="/User/ResumeMng/ResumeDelete?RNo=24527195" onclick="fncResumeDel(this.href);return false;">삭제</a></li>--%>
<%--                      </ul>--%>
<%--                    </div>--%>
<%--                    <p class="lyBtn"><button type="button" class="tplBtnTy tplLyBtnClose devLyBtnClose"><span class="blind">서비스 더보기 닫기</span></button></p>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </li>--%>
<%--        </ul>--%>
<%--      </div>--%>
<%--      <div class="message message-suggestion devLayerRookieOffer hidden" aria-hidden="false" style="display:none">--%>
<%--        <p class="text"><strong>인사담당자가 찾고 있는 신입 인재</strong>, 당신일지도 몰라요.</p>--%>
<%--        <a href="javascript:" class="link devSuggest">포지션 제안 받기 &gt;</a>--%>
<%--        <button type="button" class="button button-close-message" id="devLayerRookieOffer">닫기</button>--%>
<%--      </div>--%>
<%--    </div>--%>



<%--    <!-- TIP -->--%>
<%--    <div class="mtuTip">--%>
<%--      <strong class="skip">이용 TIP</strong>--%>
<%--      <ul class="tipList">--%>
<%--        <li>입사지원을 한 후 해당 이력서의 내용을 수정해도 <em>이전에 지원한 이력서의 내용은 바뀌지 않으므로</em> 회사마다 이력서 내용을 다르게 지원할 수 있습니다.</li>--%>
<%--      </ul>--%>
<%--    </div>--%>
<%--    <div id="devResumeEmail" name="devResumeEmail" style="position:absolute; top:100px; left:70px; z-index:9999; display:none;">--%>
<%--      <iframe id="devResumeEmailIfrm" name="devResumeEmailIfrm" width="593" height="450" marginwidth="0" marginheight="0" frameborder="no" scrolling="no" title="이력서 이메일전송 레이어"></iframe>--%>
<%--    </div>--%>
<%--  </div>--%>

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
                        <div id="resume_${resume.resumeId}">${resume.title}</div>
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

</body>
</html>
