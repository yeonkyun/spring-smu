<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col"></div>
<div class="col-md-5">
    <h1 class="text-center" style="margin-bottom: 30px;">회원가입</h1>
    <form action="/registerimpl" method="post">
        <div class="form-group">
            <input type="text" class="form-control" id="id" placeholder="아이디" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pwd">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="이름" name="name">
        </div>
        <button type="submit" class="btn btn-primary btn-block" style="margin-bottom: 20px;">회원가입</button>
    </form>
</div>
<div class="col"></div>