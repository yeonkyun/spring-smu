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
            <form action="<c:url value='/customer/searchimpl' />" method="GET" class="form-inline justify-content-end">
                <div class="form-group mb-2">
                    <select class="form-control search-select" name="keyword">
                        <option value="id" ${search.keyword == 'id' ? 'selected' : ''}>아이디</option>
                        <option value="name" ${search.keyword == 'name' ? 'selected' : ''}>이름</option>
                    </select>
                </div>
                <div class="form-group mx-sm-1 mb-2">
                    <input type="text"
                           class="form-control search-input"
                           name="search"
                           value="${search.search}"
                           required
                           placeholder="검색어를 입력하세요">
                </div>
                <button type="submit" class="btn btn-primary mb-2">검색</button>
            </form>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table" id="table">
            <thead class="thead-dark">
            <tr>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>이름</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${pageInfo.list}">
                <tr>
                    <td>
                        <a href="<c:url value='/customer/detail'>
                                      <c:param name='id' value='${customer.customerId}'/>
                                   </c:url>">
                                ${customer.customerId}
                        </a>
                    </td>
                    <td>${customer.customerPw}</td>
                    <td>${customer.customerName}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <c:if test="${not empty pageInfo.list}">
        <jsp:include page="../searchnav.jsp"/>
    </c:if>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const searchForm = document.querySelector('form');

        searchForm.addEventListener('submit', function(e) {
            const searchInput = document.querySelector('.search-input');
            if (!searchInput.value.trim()) {
                e.preventDefault();
                alert('검색어를 입력해주세요.');
            }
        });
    });
</script>