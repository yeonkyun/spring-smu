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
<script>
    let register = {
        init: function () {
            $("#register_form > button").click(() => {
                // $("#btn_login").click(() => {
                this.check();
            });

            $("#id").keyup(() => {
                $("#id_span").text("ID는 4자리 이상 입니다.");
                let id = $("#id").val();
                if (id.length >= 4) {
                    $.ajax({
                        url: '<c:url value="/checkid"/>',
                        data: {
                            rid: id
                        },
                        success: function (data) {
                            if (data.result == 1) {
                                $("#id_span").text("사용할 수 없는 아이디입니다.");
                            } else {
                                $("#id_span").text("사용 가능한 아이디입니다.");
                            }
                        }
                    });
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
            $("#register_form").attr("method", "POST");
            $("#register_form").attr("action", "/registerimpl");
            $("#register_form").submit();
        }
    };

    $(function () {
        register.init();
    });
</script>
<div class="col"></div>
<div class="col-md-5">
    <h1 class="text-center" style="margin-bottom: 30px;">회원가입</h1>
    <form id="register_form">
        <div class="form-group">
            <input type="text" class="form-control" id="id" placeholder="아이디" name="customerId">
            <span id="id_span"></span>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="customerPw">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="이름" name="customerName">
        </div>
        <button type="button" class="btn btn-primary btn-block" style="margin-bottom: 20px;">회원가입</button>
    </form>
</div>
<div class="col"></div>