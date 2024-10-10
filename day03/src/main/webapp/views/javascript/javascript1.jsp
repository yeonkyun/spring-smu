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
    window.onload = function () {
        let h5 = document.querySelector("h5");
        h5.innerHTML = "자바스크립트를 이용한 HTML 요소 제어 - JavaScript";
        let h6_1 = document.querySelector("#h6_1");
        let h6_2 = document.querySelector("#h6_2");
        let h6_3 = document.querySelector("#h6_3");

        let btn_click = document.querySelector("#btn_click");
        btn_click.onclick = function () {
            alert("버튼 클릭 이벤트 발생");
        };

        let a_click = document.querySelector("#a_click");
        a_click.onclick = function () {
            let moveConfirm = confirm("이동 하시겠습니까?");
            if (moveConfirm) {
                location.href = "<c:url value='/javascript/javascript2' />";
            };
        };
    };
</script>
<div class="col-sm-9 mx-auto">
    <h2>자바스크립트 실습 예제 1</h2>
    <button class="btn btn-outline-secondary btn-block" id="btn_click" style="margin: 20px">클릭</button>
    <a class="" href="#" id="a_click" style="margin: 20px">클릭 2</a>
    <h5>자바스크립트를 이용한 HTML 요소 제어</h5>
    <h6 id="h6_1">Header 1</h6>
    <h6 id="h6_2">Header 2</h6>
    <h6 id="h6_3">Header 3</h6>
</div>