<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-3">
    <h3>자바스크립트</h3>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/javascript/javascript1" />">자바스크립트 1</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/javascript/javascript2" />">자바스크립트 2</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/javascript/javascript3" />">자바스크립트 3</a>
        </li>
    </ul>
    <hr class="d-sm-none">
</div>