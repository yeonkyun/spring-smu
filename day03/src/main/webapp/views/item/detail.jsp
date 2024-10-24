<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 23.
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
    <div class="col-sm-6">
        <img src="<c:url value="/images"/>/${item.imgName}" alt="${item.itemName}" style="width: 250px">
    </div>
    <div class="col-sm-6 d-flex">
        <div>
            <h2 class="text-left">${item.itemName}</h2>
            <h3 class="text-right"><fmt:formatNumber value="${item.itemPrice}" type="currency" currencySymbol=""/>원</h3>
            <button class="btn btn-primary btn-block" onclick="location.href='<c:url value="/cart/add"/>'">장바구니 담기</button>
        </div>
    </div>
</div>
