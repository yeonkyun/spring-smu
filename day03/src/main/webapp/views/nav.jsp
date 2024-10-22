<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 22.
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- pagination start -->
<div class="col text-center ">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${customerPage.getPrePage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value="${target}/getpage?pageNo=${customerPage.getPrePage()}" />">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${customerPage.getNavigateFirstPage() }" end="${customerPage.getNavigateLastPage() }"
                   var="page">
            <c:choose>
                <c:when test="${customerPage.getPageNum() == page}">
                    <li class="page-item active">
                        <a class="page-link" href="<c:url value="${target}/getpage?pageNo=${page}" />">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="${target}/getpage?pageNo=${page}" />">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${customerPage.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link"
                       href="<c:url value="${customerPage}/getpage?pageNo=${customerPage.getNextPage()}" />">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link" href="#">Next</a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->