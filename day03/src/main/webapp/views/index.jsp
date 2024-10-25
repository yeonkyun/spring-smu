<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오전 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>SW몰입형 학기제 연습장</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <script src="<c:url value="/js/index.js"/> "></script>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoApiKey}"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<div class="text-center bg-dark text-white" style="padding: 50px">
    <h1 onclick="location.href='<c:url value="/"/>'" style="cursor: pointer;">SW몰입형 학기제 연습장</h1>
<%--    <img src="<c:url value="/img/1000001.jpg"/> ">--%>
<%--    <img src="<c:url value="/images/Apple%20May%20Event.png"/> ">--%>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="padding-inline: 30px;">
    <a class="navbar-brand" href="<c:url value="/" />">홈</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav mr-auto">
            <c:if test="${sessionScope.loginid != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/customer" />">고객</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/item" />">상품</a>
                </li>
            </c:if>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/javascript" />">자바스크립트</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/ajax" />">AJAX</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/map" />">지도</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/chart" />">차트</a>
            </li>
            <c:if test="${sessionScope.loginid != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/cart" />">장바구니</a>
                </li>
            </c:if>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/webcam" />">웹캠</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/about" />">더보기</a>
            </li>
            <%--            <li class="nav-item">--%>
            <%--                <a class="nav-link" href="/">링크</a>--%>
            <%--            </li>--%>
        </ul>
        <c:choose>
            <c:when test="${sessionScope.loginid == null}">
                <ul class="nav m">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/login' />">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/register' />">회원가입</a>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav m">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='#' />">${sessionScope.loginid.customerName}님</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/logoutimpl' />">로그아웃</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<div class="container flex-grow-1" style="margin-top:30px">
    <div class="row">
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<footer>
    <div class="text-center bg-dark text-white" style="margin-top: 30px; padding: 40px">
        <p>SW몰입형 학기제 연습장</p>
    </div>
</footer>
</body>
</html>