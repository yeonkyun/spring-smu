<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 14.
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-9 mx-auto">
    <h2>회원가입 완료</h2>
    <h5>${sessionScope.loginid.customerName}님 회원가입을 환영합니다.</h5>
</div>