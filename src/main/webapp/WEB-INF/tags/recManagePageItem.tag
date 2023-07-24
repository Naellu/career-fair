<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="recPageNum" %>

<c:url value="/admin/management/recruitmanagement" var="recpageLink">
    <c:param name="page" value="${recPageNum }" />
    <c:if test="${not empty param.search }">
        <c:param name="search" value="${param.search }" />
    </c:if>
    <c:if test="${not empty param.type }">
        <c:param name="type" value="${param.type }" />
    </c:if>
<%--    <c:if test="${not empty param.round }">--%>
<%--        <c:param name="round" value="${param.round }" />--%>
<%--    </c:if>--%>
</c:url>
<li class="page-item">
    <a class="page-link ${recPageNum eq pageInfo.thisPage ? 'active' : '' }" href="${recpageLink }">
        <jsp:doBody></jsp:doBody>
    </a>
</li>