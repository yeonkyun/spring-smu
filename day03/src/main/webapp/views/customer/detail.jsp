<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 21.
  Time: 오후 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    let register = {
        init: function () {
            $("#update_btn").click(() => {
                this.check();
            });
            $("#delete_btn").click(() => {
                let id = $("#id").val();
                let result = confirm("정말 삭제하시겠습니까?");
                if (result) {
                    location.href = "<c:url value='/customer/deleteimpl'/>?customerId=" + id;
                }
            });
        },
        check: function () {
            let id = $("#id").val();
            let pw = $("#pw").val();
            let name = $("#name").val();

            if (id === "") {
                alert("아이디를 입력해주세요.");
                $("#id").focus();
                return;
            } else if (pw === "") {
                alert("비밀번호를 입력해주세요.");
                $("#pw").focus();
                return;
            } else if (name === "") {
                alert("이름을 입력해주세요.");
                $("#name").focus();
                return;
            } else {
                this.send();
            }
        },
        send: function () {
            // method: "POST" 방식으로 전송
            // action: "/login" URL로 전송
            $("#detail_form").attr("method", "POST");
            $("#detail_form").attr("action", "<c:url value='/customer/updateimpl'/>");
            $("#detail_form").submit();
        }
    };

    $(function () {
        register.init();
    });
</script>
<div class="col"></div>
<div class="col-md-5">
    <h1 class="text-center" style="margin-bottom: 30px;">상세 정보</h1>
    <form id="detail_form">
        <div class="form-group">
            <input type="text" class="form-control" id="id" value="${customer.customerId}" placeholder="아이디" name="customerId" readonly>
            <span id="id_span"></span>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw" value="${customer.customerPw}" placeholder="비밀번호" name="customerPw">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="name" value="${customer.customerName}" placeholder="이름" name="customerName">
        </div>
        <button id="update_btn" type="button" class="btn btn-primary btn-block" style="margin-bottom: 20px;">수정</button>
        <button id="delete_btn" type="button" class="btn btn-danger btn-block" style="margin-bottom: 20px;">삭제</button>
    </form>
</div>
<div class="col"></div>