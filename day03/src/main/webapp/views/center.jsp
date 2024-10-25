<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    let center = {
        init: () => {
            $.ajax({
                url: '<c:url value="/weather"/>',
                type: 'GET',
                success: data => {
                    let wfSv = data.response.body.items.item[0].wfSv;
                    $('#weather').text(wfSv);
                },
                error: e => {
                    alert('날씨 정보를 가져오는데 실패했습니다.');
                }
            });

            $.ajax({
                url: '<c:url value="/openWeather"/>',
                type: 'GET',
                success: data => {
                    let weather = data.weather[0].description;
                    let icon = data.weather[0].icon;
                    let iconUrl = 'http://openweathermap.org/img/wn/' + icon + '@2x.png';
                    $('#openWeather').html('<img src="' + iconUrl + '"/>' + weather);
                },
                error: e => {
                    alert('날씨 정보를 가져오는데 실패했습니다.');
                }
            });
        }
    }
    $(function () {
        center.init();
    });
</script>
<div class="col-sm-9">

    <h2>TITLE HEADING</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div class="fakeimg">Fake Image</div>
    <br>
    <p id="weather"></p>
    <p id="openWeather"></p>
</div>