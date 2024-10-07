<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 7.
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Boot를 활용한 예제</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <h1>메인 페이지</h1>
    <a href="/next">다음 페이지로 이동</a>
    <br><br>
    <a href="/mypage">마이페이지로 이동</a>
    <br><br>
    <a>${message}</a>
    <br>
    <a>${number}</a>
</body>
</html>
