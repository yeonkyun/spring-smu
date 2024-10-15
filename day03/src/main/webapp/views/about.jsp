<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 8.
  Time: 오후 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>

</style>
<script>
    let bycicleMarker = null;
    let about = {
        init: function () {
            this.map1();
            this.map2();
        },
        map1: function () {
            let mapContainer = document.getElementById('map1'); // 지도를 표시할 div
            let mapOption = {
                center: new kakao.maps.LatLng(36.800269, 127.074960), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);

            let mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition = new kakao.maps.LatLng(36.800269, 127.074960);
            let marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            setInterval(() => {
                if (bycicleMarker) {
                    bycicleMarker.setMap(null);
                }
                $.ajax({
                    url: '/getbike',
                    success: (data) => {
                        this.makeMarker(map, data.lat, data.lng);
                    }
                })
                this.makeMarker(map);
            }, 1000);
        },
        map2: function () {
            let mapContainer = document.getElementById('map2'); // 지도를 표시할 div
            let mapOption = {
                center: new kakao.maps.LatLng(36.800269, 127.074960), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);

            let mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

            let zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition = new kakao.maps.LatLng(36.800269, 127.074960);
            let marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },
        makeMarker(map, lat, lng) {
            bycicleMarker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                image: new kakao.maps.MarkerImage('<c:url value="/img/motor.png"/> ', new kakao.maps.Size(30, 30))
            });
            bycicleMarker.setMap(map);
        }
    };

    $(function () {
        about.init();
    });
</script>
<div class="col-sm-9">
    <h2>소개</h2>
    <div class="row">
        <div class="col-sm-6">
            <div class="mx-auto" id="map1" style="width: 100%; max-width: 100%; height: 400px;"></div>
        </div>
        <div class="col-sm-6">
            <div class="mx-auto" id="map2" style="width: 100%; max-width: 100%; height: 400px;"></div>
        </div>
    </div>
</div>