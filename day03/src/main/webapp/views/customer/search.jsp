<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-9">
    <h2>고객 검색</h2>
    <div class="row">
        <div class="col">
            <form action="<c:url value="/customer/searchimpl" />" method="GET" class="form-inline justify-content-end">
                <div class="form-group mb-2">
                    <select class="form-control" name="keyword">
                        <option value="id" <c:if test="${search.keyword == 'id'}">selected</c:if>>
                            아이디
                        </option>
                        <option value="name" <c:if test="${search.keyword == 'name'}">selected</c:if>>
                            이름
                        </option>
                    </select>
                </div>
                <div class="form-group mx-sm-1 mb-2">
                    <input type="text" class="form-control" name="search" style="width: 200px;"
                           <c:if test="$search.search != null">value="${search.search}"</c:if>>
                </div>
                <button type="submit" class="btn btn-primary mb-2">검색</button>
            </form>
        </div>
    </div>
    <table class="table" id="table">
        <thead class="thead-dark">
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerPage.list}">
            <tr>
                <td><a href="/customer/detail?id=${customer.customerId}">${customer.customerId}</a></td>
                <td>${customer.customerPw}</td>
                <td>${customer.customerName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty customerPage.list}">
        <jsp:include page="../searchnav.jsp"/>
    </c:if>
</div>