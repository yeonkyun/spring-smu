<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    let loginimpl = "<c:url value='/loginimpl'/>";
    $(document).ready(function () {
        javascript5.init();
    });
</script>
<div class="col-sm-7 mx-auto">
    <h2 style="margin-bottom: 30px">자바스크립트 실습 예제 5</h2>
    <form id="login_form">
        <div class="form-group">
            <input type="text" class="form-control" id="id" placeholder="아이디" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw">
        </div>
        <button type="button" class="btn btn-primary btn-block" id="btn_login" style="margin-bottom: 20px;">로그인</button>
    </form>
</div>