<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 23.
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-sm-9 mx-auto">
    <h2 style="margin-bottom: 10px">상품 조회</h2>
    <div class="row">
        <div class="col">
            <form action="<c:url value="/item/search" />" method="GET" class="form-inline justify-content-end">
                <div class="form-group mb-2">
                    <select class="form-control" name="keyword" id="searchType">
                        <option value="name" <c:if test="${search.keyword == 'name'}">selected</c:if>>상품명</option>
                        <option value="price" <c:if test="${search.keyword == 'price'}">selected</c:if>>가격</option>
                        <option value="date" <c:if test="${search.keyword == 'date'}">selected</c:if>>날짜</option>
                    </select>
                </div>

                <!-- 일반 검색 입력 필드 -->
                <div class="form-group mx-sm-1 mb-2" id="normalSearchField">
                    <input type="text" class="form-control" name="search" style="width: 200px;"
                           <c:if test="${search.search != null}">value="${search.search}"</c:if>>
                </div>

                <!-- 날짜 검색 필드 -->
                <div class="form-group mx-sm-1 mb-2" id="dateSearchFields" style="display: none;">
                    <input type="text" class="form-control" id="startDate" name="startDate"
                           placeholder="시작일" style="width: 120px;" readonly>
                    <span class="mx-1">~</span>
                    <input type="text" class="form-control" id="endDate" name="endDate"
                           placeholder="종료일" style="width: 120px;" readonly>
                </div>

                <button type="submit" class="btn btn-primary mb-2">검색</button>
            </form>
        </div>
    </div>
    <table class="table table-hover" id="table">
        <thead class="thead-dark text-center">
        <tr>
            <th>이미지</th>
            <th>상품명</th>
            <th>가격</th>
            <th>등록일자</th>
        </thead>
        <tbody class="text-center">
        <c:forEach var="item" items="${pageInfo.getList()}">
            <tr style="cursor: pointer;" onclick="location.href='<c:url value="/item/detail"/>?id=${item.itemId}'">
                <td class="align-middle"><img src="<c:url value="/images"/>/${item.imgName}" alt="${item.itemName}"
                                              style="width: 75px; height: 75px"></td>
                <td class="align-middle">${item.itemName}</td>
                <td class="align-middle"><fmt:formatNumber value="${item.itemPrice}" type="currency" currencySymbol=""/>원</td>
                <td class="align-middle">
                    <fmt:parseDate value="${item.regDate}"
                                   pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parsedDateTime}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../nav.jsp"/>
</div>
<script>
    $(document).ready(function() {
        // Datepicker 초기화
        $("#startDate, #endDate").datepicker({
            dateFormat: 'yy-mm-dd',
            showOtherMonths: true,
            showMonthAfterYear: true,
            yearSuffix: '년',
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            changeMonth: true,
            changeYear: true
        });

        // 검색 타입 변경 시 이벤트
        $("#searchType").change(function() {
            if ($(this).val() === "date") {
                $("#dateSearchFields").show();
                $("#normalSearchField").hide();
            } else {
                $("#dateSearchFields").hide();
                $("#normalSearchField").show();
            }
        });

        // 페이지 로드 시 초기 상태 설정
        if ($("#searchType").val() === "date") {
            $("#dateSearchFields").show();
            $("#normalSearchField").hide();
        }

        // startDate가 endDate보다 늦은 날짜가 되지 않도록 제한
        $("#startDate").datepicker('option', 'onClose', function(selectedDate) {
            $("#endDate").datepicker('option', 'minDate', selectedDate);
        });

        $("#endDate").datepicker('option', 'onClose', function(selectedDate) {
            $("#startDate").datepicker('option', 'maxDate', selectedDate);
        });
    });
</script>