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
    $(document).ready(function () {
        $("#btn_getData").click(function () {
            javascript_4.init();
        });
    });
</script>
<div class="col-sm-9 mx-auto">
    <h2>자바스크립트 실습 예제 4</h2>
    <h5>자바스크립트를 이용한 HTML 요소 제어</h5>
    <button class="btn btn-outline-secondary btn-block" id="btn_getData" style="margin-bottom: 10px">데이터 가져오기</button>
    <table class="table" id="table">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>아이디</th>
            <th>이름</th>
            <th>나이</th>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty users}">
                <tr>
                    <td colspan="3">데이터가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>