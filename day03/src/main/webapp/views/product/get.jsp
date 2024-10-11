<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 11.
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-9 mx-auto">
    <h2 style="margin-bottom: 30px">상품 조회</h2>
    <table class="table table-hover" id="table">
        <thead class="thead-dark text-center">
        <tr>
            <th>#</th>
            <th>이미지</th>
            <th>상품명</th>
            <th>가격</th>
            <th>등록일자</th>
        </thead>
        <tbody class="text-center">
        <c:forEach var="product" items="${products}">
            <tr>
                <td class="align-middle">${product.id}</td>
                <td class="align-middle"><img src="<c:url value='/img/${product.id}.jpg' />" alt="${product.name}" style="width: 100px; height: 100px"></td>
                <td class="align-middle">${product.name}</td>
                <td class="align-middle"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="" />원</td>
                <td class="align-middle"><fmt:formatDate value="${product.regDate}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>