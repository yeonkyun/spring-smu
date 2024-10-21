<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 11.
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-9 mx-auto">
    <h2 style="margin-bottom: 30px">고객 조회</h2>
    <table class="table" id="table">
        <thead class="thead-dark">
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customers}">
            <tr>
                <td><a href="/customer/detail?id=${customer.customerId}">${customer.customerId}</a></td>
                <td>${customer.customerPw}</td>
                <td>${customer.customerName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>