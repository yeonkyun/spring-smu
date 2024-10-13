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
    let workshop = {
        init: function () {
            this.getData(); // 초기 데이터 로드
            setInterval(() => {
                this.getData();
            }, 5000); // 5초마다 데이터 갱신
        },
        getData: function () {
            $.ajax({
                url: '<c:url value="/getrank"/>',
                type: 'GET',
                dataType: 'json',
                success: (data) => {
                    this.displayData(data);
                },
                error: (xhr, status, error) => {
                    console.error('AJAX 요청 실패:', status, error);
                }
            });
        },
        displayData: function (data) {
            let tbody = $('#table tbody');
            tbody.empty();

            $.each(data, function(index, item) {
                let row = $('<tr>');
                row.append($('<td>').text(item.rank));
                row.append($('<td>').text(item.keyword));
                tbody.append(row);
            });
        }
    };

    $(function () {
        workshop.init();
    });
</script>
<div class="col-sm-9">
    <h2>AJAX 워크숍</h2>
    <li>5초에 한 번씩 서버에 데이터를 요청하여 인기 순위 데이터를 받아서 테이블에 출력.</li>
    <li style="margin-bottom: 10px">단, 인기 순위 데이터는 랜덤하게 만들어진다.</li>
    <table class="table table-hover text-center align-middle" id="table">
        <thead class="thead-dark">
        <tr>
            <th>순위</th>
            <th>검색어</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>