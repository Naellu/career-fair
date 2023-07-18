<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pageNum" %>

<c:url value="/member/resume/scout" var="pageLink">
    <c:param name="page" value="${pageNum }" />
    <c:if test="${not empty param.industry }">
        <c:forEach items="${paramValues.industry}" var="industry">
            <c:param name="industry" value="${industry }" />
        </c:forEach>
    </c:if>
</c:url>
<li class="page-item">
    <a class="page-link ${pageNum eq pageInfo.currentPageNum ? 'active' : '' }" href="${pageLink }">
        <jsp:doBody></jsp:doBody>
    </a>
</li>