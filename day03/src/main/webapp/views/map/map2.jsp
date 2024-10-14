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
<style>
    #map{
        width:600px;
        height:500px;
        border:2px solid darkred;
    }
</style>
<script>
    let map2 = {
        init:function(){
            $('#sbtn').click(()=>{
                // 37.554472, 126.980841
                this.makemap(37.554472, 126.980841,'남산','s1.jpg',100);
            });
            $('#bbtn').click(()=>{
                // 35.175109, 129.175474
                this.makemap(35.175109, 129.175474,'해운대','s2.jpg',200);
            });
            $('#jbtn').click(()=>{
                // 33.254564, 126.560944
                this.makemap(33.254564, 126.560944,'서귀포','s3.jpg',300);
            });
        },
        makemap:function(lat,lng,title, img, target){
            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 5
            };
            let map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            var markerPosition  = new kakao.maps.LatLng(lat,lng);
            let marker = new kakao.maps.Marker({
                map:map,
                position: markerPosition
            });
            let iwContent = '<p>'+title+'</p>';
            iwContent += '<img style="width:150px;" src="<c:url value="/img/'+img+'"/> ">';
            let iwPosition = new kakao.maps.LatLng(lat,lng); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(marker,'mouseover',overHandler(map,marker,infowindow));
            kakao.maps.event.addListener(marker,'mouseout',outHandler(infowindow));
            kakao.maps.event.addListener(marker,'click',clickHandler(target));
            function clickHandler(target){
                return function(){
                    location.href='<c:url value="/map/go?target=' + target + '"/>';
                };
            };
            function overHandler(map,marker,infowindow){
                return function(){
                    infowindow.open(map, marker);
                };
            };
            function outHandler(infowindow){
                return function(){
                    infowindow.close();
                };
            };
        }
    };
    $(function(){
        map2.init();
    });
</script>
<div class="col-sm-9">

    <h2>지도 실습 예제 2</h2>
    <button id="sbtn">Seoul</button>
    <button id="bbtn">Busan</button>
    <button id="jbtn">Jeju</button>
    <div id="map"></div>

</div>