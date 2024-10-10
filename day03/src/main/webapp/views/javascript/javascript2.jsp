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
    };

    let variable_1 = 10.1;
    let variable_2 = '"텍스트"';
    let variable_3 = "텍스트";
    let variable_4 = true;

    // function declaration
    let variable_5 = function () {
    };

    function variable_6() {
    };

    let variable_7;

    // object
    let variable_8 = [ 1, 2, 3, "텍스트" ];
    let variable_9 = {
        name: "홍길동",
        age: 20,
        address: "서울",
        go: function () {},
        stop: function () {}
    }

    // JSON(JavaScript Object Notation)
    let variable_10 = [ { name: "홍길동", age: 20 }, { name: "홍길순", age: 21 } ];

    console.log(typeof variable_1);
    console.log(typeof variable_2);
    console.log(typeof variable_3);
    console.log(typeof variable_4);
    console.log(typeof variable_5);
    console.log(typeof variable_6);
    console.log(typeof variable_7);
    console.log(typeof variable_8);
    console.log(typeof variable_9);
    console.log(typeof variable_10);

</script>
<div class="col-sm-9 mx-auto">
    <h2>자바스크립트 실습 예제 2</h2>
</div>