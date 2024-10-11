<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    let login = {
        init:function(){
            $('#login_form > button').click(()=>{
                this.check();
            });
        },
        check:function(){
            let id = $('#id').val();
            let pw = $('#pw').val();
            if(id == '' || id == null){
                alert('아이디는 필수입니다.');
                $('#id').focus();
                return;
            }
            if(pw == '' || pw == null){
                alert('패스워드는 필수입니다.');
                $('#pwd').focus();
                return;
            }
            this.send();
        },
        send:function(){
            // method, action
            $('#login_form').attr('method','post');
            $('#login_form').attr('action','/loginimpl');
            $('#login_form').submit();
        }
    };
    $(function(){
        login.init();
    });
</script>
<div class="col"></div>
<div class="col-md-5">
    <h1 style="text-align: center; margin-bottom: 30px;">로그인</h1>
    <form id="login_form">
        <div class="form-group">
            <input type="text" class="form-control" id="id" placeholder="아이디" name="id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pw" placeholder="비밀번호" name="pw">
        </div>
        <button type="button" class="btn btn-primary btn-block" style="margin-bottom: 20px;">로그인</button>
    </form>
</div>
<div class="col"></div>
