<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>관리자</title>
    <!-- 사용자 정의 CSS -->
    <link rel="stylesheet" href="<c:url value="/css/administrator.css"/>">
    <!-- CSS -->
    <link rel="stylesheet"
          href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/typicons/2.1.2/typicons.min.css"/>">

    <!-- favicon -->
    <link rel="shortcut icon" href="<c:url value="/images/favicon.png"/>"/>
</head>

<body>
<%--<c:if test="${userType == 'admin' || userType == 'manager'}">--%>
<div class="container-scroller">
    <!-- 네비게이션 바 -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
            <a class="navbar-brand brand-logo" href="<c:url value="/"/>"><img
                    src="<c:url value="/images/logo.svg"/>" alt="logo"/></a>
            <a class="navbar-brand brand-logo-mini" href="<c:url value="/"/>"><img
                    src="<c:url value="/images/logo-mini.svg"/>" alt="logo"/></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
            <ul class="navbar-nav mr-lg-2">
                <li class="nav-item  d-none d-lg-flex">
                    <a class="nav-link" href="<c:url value="/"/>">
                        메인 페이지
                    </a>
                </li>
                <li class="nav-item  d-none d-lg-flex">
                    <a class="nav-link active" href="#">
                        관리 시스템
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown d-flex">
                    <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
                       id="messageDropdown" href="#" data-toggle="dropdown">
                        <i class="typcn typcn-message-typing"></i>
                        <!-- 수신된 메세지 개수 표시 -->
                        <span class="count bg-success">1</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                         aria-labelledby="messageDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">메세지</p>
                    </div>
                </li>
                <li class="nav-item dropdown  d-flex">
                    <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center"
                       id="notificationDropdown" href="#" data-toggle="dropdown">
                        <i class="typcn typcn-bell mr-0"></i>
                        <!-- 수신된 알람 개수 표시 -->
                        <span class="count bg-danger">1</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                         aria-labelledby="notificationDropdown">
                        <p class="mb-0 font-weight-normal float-left dropdown-header">알림</p>
                    </div>
                </li>
                <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle  pl-0 pr-0" href="#" data-toggle="dropdown" id="profileDropdown">
                        <i class="typcn typcn-user-outline mr-0"></i>
                        <span class="nav-profile-name">${userName}님</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                        <a class="dropdown-item" href="<c:url value="//logout"/>">
                            <i class="typcn typcn-power text-primary"></i>
                            로그아웃
                        </a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                <span class="typcn typcn-th-menu"></span>
            </button>
        </div>
    </nav>
    <!-- 네비게이션 바 끝 -->

    <div class="container-fluid page-body-wrapper">
        <!-- 사이드바 -->
<%--        <c:choose>--%>
<%--            <c:when test="${sidebar == null}">--%>
<%--                <jsp:include page="sidebar.jsp"/>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <div class="d-flex sidebar-profile">
                        <div class="sidebar-profile-name">
                            <p class="sidebar-name">
                                ${userName}님
                            </p>
                            <p class="sidebar-designation">
                                <c:choose>
                                    <c:when test="${userType == 'admin'}">
                                        관리자
                                    </c:when>
                                    <c:when test="${userType == 'manager'}">
                                        매니저
                                    </c:when>
                                    <c:otherwise>
                                        【직책 오류】 담당자에게 문의하세요.
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                    <p class="sidebar-menu-title">관리자 메뉴</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/"/>">
                        <i class="typcn typcn-device-desktop menu-icon"></i>
                        <span class="menu-title">대시보드</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/user"/>">
                        <i class="typcn typcn-user-outline menu-icon"></i>
                        <span class="menu-title">사용자 정보 관리</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#transaction" aria-expanded="false"
                       aria-controls="transaction">
                        <i class="typcn typcn-th-large menu-icon"></i>
                        <span class="menu-title">주문 관리</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="transaction">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/transactions"/>">주문
                                목록</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/transactions/add"/>">주문 추가</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/transactions/modify"/>">주문
                                수정</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/transactions/delete"/>">주문
                                삭제</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#product" aria-expanded="false"
                       aria-controls="product">
                        <i class="typcn typcn-th-large menu-icon"></i>
                        <span class="menu-title">상품 관리</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="product">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value="//administrator/products"/>">상품
                                목록</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/products/add"/>">상품 추가</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/products/modify"/>">상품 수정</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/products/delete"/>">상품 삭제</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/products/review"/>">상품 리뷰</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#coupon" aria-expanded="false"
                       aria-controls="coupon">
                        <i class="typcn typcn-th-large menu-icon"></i>
                        <span class="menu-title">쿠폰 관리</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="coupon">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value="//administrator/coupons"/>">쿠폰
                                목록</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/coupons/add"/>">쿠폰 추가</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/coupons/modify"/>">쿠폰 수정</a>
                            </li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="//administrator/coupons/delete"/>">쿠폰 삭제</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false"
                       aria-controls="error">
                        <i class="typcn typcn-globe-outline menu-icon"></i>
                        <span class="menu-title">오류 페이지</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="error">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="<c:url value="/404"/>"> 404 </a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="<c:url value="/500"/>"> 500 </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <ul class="sidebar-legend">
                <li>
                    <p class="sidebar-menu-title">담당자 문의</p>
                </li>
                <li class="nav-item row">
                    <a href="<c:url value="/tel:01046232592"/>" class="nav-link"><img
                            src="<c:url value="/images/sms-icons/Phone.png"/>" alt="phone"
                            style="width: 40px; border-radius: 7px;"></a>
                    <a href="<c:url value="/sms:01046232592"/>" class="nav-link"><img
                            src="<c:url value="/images/sms-icons/IMessage.png"/>" alt="iMessage"
                            style="width: 40px;"></a>
                    <a href="https://open.kakao.com/o/suEU4d8e" target="_blank" class="nav-link"><img
                            src="<c:url value="/images/sms-icons/KakaoTalk.png"/>" alt="kakaoTalk" style="width: 40px;"></a>
                </li>
            </ul>
        </nav>
        <!-- 사이드바 끝 -->

        <!-- 메인 패널 -->
        <c:choose>
            <c:when test="${mainPanel == null}">
                <jsp:include page="main-panel.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${mainPanel}.jsp"/>
            </c:otherwise>
        </c:choose>
        <!-- main-panel 끝 -->
    </div>
    <!-- page-body-wrapper 끝 -->
</div>
<!-- container-scroller 끝 -->

<!-- 기본 JavaScript 파일 -->
<script src="<c:url value="/vendors/js/vendor.bundle.base.js"/>"></script>
<!-- 사용자 정의 JavaScript -->
<script src="<c:url value="/js/off-canvas.js"/>"></script>
<script src="<c:url value="/js/hoverable-collapse.js"/>"></script>
<script src="<c:url value="/js/template.js"/>"></script>

<!-- 페이지별 플러그인 JavaScript -->

<!-- 페이지별 사용자 정의 JavaScript -->
<%--</c:if>--%>
<%--<c:if test="${userType != 'admin' && userType != 'manager'}">--%>
<%--    <c:import url="/404"/>--%>
<%--</c:if>--%>
</body>

</html>