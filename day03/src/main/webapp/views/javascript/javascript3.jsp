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
    // function display(datas) {
    //     let table = document.querySelector("#table");
    //     let tbody = table.querySelector("tbody");
    //     tbody.innerHTML = "";
    //     datas.forEach(data => {
    //         let tr = document.createElement("tr");
    //         let td1 = document.createElement("td");
    //         let td2 = document.createElement("td");
    //         let td3 = document.createElement("td");
    //         td1.innerHTML = data.id;
    //         td2.innerHTML = data.name;
    //         td3.innerHTML = data.age;
    //         tr.appendChild(td1);
    //         tr.appendChild(td2);
    //         tr.appendChild(td3);
    //         tbody.appendChild(tr);
    //     });
    // }

    function display(datas) {
        let tbody = $("#table tbody");
        tbody.empty(); // Clear the table body
        $(datas).each(function (index, data) {
            let tr = $("<tr></tr>");
            let td0 = $("<td></td>").text(index + 1);
            let td1 = $("<td></td>").text(data.id);
            let td2 = $("<td></td>").text(data.name);
            let td3 = $("<td></td>").text(data.age);
            tr.append(td0);
            tr.append(td1);
            tr.append(td2);
            tr.append(td3);
            tbody.append(tr);
        });
    }

    function getData() {
        let datas = [{id: "id01", name: "홍길동", age: 10},
            {id: "id02", name: "홍길순", age: 20},
            {id: "id03", name: "홍길만", age: 30},
            {id: "id04", name: "홍길술", age: 40},
            {id: "id05", name: "홍길숙", age: 50}];
        display(datas);
    };

    $(document).ready(function () {
        $("#btn_getData").click(function () {
            getData();
        });
    });
</script>
<div class="col-sm-9 mx-auto">
    <h2>자바스크립트 실습 예제 3</h2>
    <h5>자바스크립트를 이용한 HTML 요소 제어</h5>
    <button class="btn btn-outline-secondary btn-block" id="btn_getData" style="margin-bottom: 10px">데이터 가져오기</button>
    <table class="table" id="table">
        <thead class="thead-dark">
        <tr>
            <th>#</th>
            <th>아이디</th>
            <th>이름</th>
            <th>나이</th>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${empty users}">
                <tr>
                    <td colspan="3">데이터가 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.age}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>