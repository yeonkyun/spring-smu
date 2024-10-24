<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 22.
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- pagination start -->
<div class="col text-center">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${pageInfo.hasPreviousPage}">
                <li class="page-item">
                    <a class="page-link bg-dark text-white border-dark" href="<c:url value="/${target}/searchimpl?pageNo=${pageInfo.prePage}&keyword=${search.keyword}&search=${search.search}" />">이전</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link bg-secondary text-white border-secondary" href="#">이전</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach var="page" begin="1" end="${pageInfo.pages}">
            <c:choose>
                <c:when test="${pageInfo.pageNum == page}">
                    <li class="page-item active">
                        <a class="page-link bg-dark border-dark" href="<c:url value="/${target}/searchimpl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}" />">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link text-dark" href="<c:url value="/${target}/searchimpl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}" />">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${pageInfo.hasNextPage}">
                <li class="page-item">
                    <a class="page-link bg-dark text-white border-dark" href="<c:url value="/${target}/searchimpl?pageNo=${pageInfo.nextPage}&keyword=${search.keyword}&search=${search.search}" />">다음</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link bg-secondary text-white border-secondary" href="#">다음</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
<!-- pagination end -->