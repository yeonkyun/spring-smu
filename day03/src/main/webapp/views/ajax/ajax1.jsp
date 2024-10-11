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
    let ajax1 = {
            init: function () {
                setInterval(() => {
                    this.getData();
                }, 1000);
            },
            getData: function () {
                $.ajax({
                    url: '<c:url value="/getctime"/>',
                    success: (data) => {
                        this.displayData(data);
                    }
                });
            },
            displayData: function (data) {
                $('#ctime').text(data.currentTime);
            }
        };

    $(function () {
        ajax1.init();
    });
</script>
<div class="col-sm-9">
    <h2>AJAX 실습 예제 1</h2>
    <h1 id="ctime"></h1>
</div>