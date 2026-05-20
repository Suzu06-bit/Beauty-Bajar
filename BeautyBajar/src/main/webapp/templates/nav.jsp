<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar">
    <ul>
        <li>
            <c:if test="${not empty param.back_title}">
                <a href="${param.back_href}">&lt; Back (${param.back_title})</a>
            </c:if>
        </li>
        <li><p>${param.page_title}</p></li>
        <li>
            <c:if test="${not empty param.action_title}">
                <a href="${param.action_href}">${param.action_title}</a>
            </c:if>
        </li>
    </ul>
</nav>
