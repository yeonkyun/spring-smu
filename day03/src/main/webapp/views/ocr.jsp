<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 11. 21.
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-sm-9">
    <h2>OCR</h2>
    <form id="item_add_form" action="<c:url value='/ocrimpl'/>" method="post" enctype="multipart/form-data">
        <div class="form-row align-items-center">
            <div class="col-11">
                <label for="image" class="sr-only">이미지:</label>
                <input type="file" class="form-control mb-2" id="image" name="image" placeholder="이미지를 선택하세요">
            </div>
            <div class="col-auto">
                <button id="btn_add" type="submit" class="btn btn-primary mb-2">제출</button>
            </div>
        </div>
    </form>
    <c:if test="${not empty imgname}">
        <img width="200px" src="<c:url value='/images/${imgname}'/>" alt="Uploaded Image">
    </c:if>
    <c:if test="${not empty result}">
        <h3>사업자명: ${result.bizname}</h3>
        <h3>대표자명: ${result.bizowner}</h3>
        <h3>설립일: ${result.bizdate}</h3>
        <h3>주소: ${result.bizadd}</h3>
    </c:if>
</div>