<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>

</script>
<div class="col-sm-9">
    <h2>AJAX 워크숍</h2>
    <li>5초에 한 번씩 서버에 데이터를 요청하여 인기순위 데이터를 받아서 테이블에 출력.</li>
    <li style="margin-bottom: 10px">단, 인기 순위 데이터는 랜덤하게 만들어진다.</li>
    <table class="table table-hover text-center align-middle" id="table">
        <thead class="thead-dark">
        <tr>

        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty users}">
                <tr>
                    <td class="align-middle" colspan="3">데이터가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="user" items="${users}">
                    <tr>

                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>