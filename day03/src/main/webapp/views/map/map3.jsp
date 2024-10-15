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
    #map {
        width: 100%;
        height: 500px;
        border: 2px solid darkred;
    }

    #ms {
        width: 100%;
        height: 500px;
        border: 2px solid darkred;
        overflow: auto;
        float: right;
    }
</style>
<script>
    let map3 = {
        init: function () {
            this.makemap(37.554472, 126.980841, '남산', 's1.jpg', 100);

            $('#sbtn').click(() => {
                // 37.554472, 126.980841
                this.makemap(37.554472, 126.980841, '남산', 's1.jpg', 100);
            });
            $('#bbtn').click(() => {
                // 35.175109, 129.175474
                this.makemap(35.175109, 129.175474, '해운대', 's2.jpg', 200);
            });
            $('#jbtn').click(() => {
                // 33.254564, 126.560944
                this.makemap(33.254564, 126.560944, '서귀포', 's3.jpg', 300);
            });
        },
        makemap: function (lat, lng, title, img, target) {
            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 7
            };
            let map = new kakao.maps.Map(mapContainer, mapOption);
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition = new kakao.maps.LatLng(lat, lng);
            let marker = new kakao.maps.Marker({
                map: map,
                position: markerPosition
            });

            let iwContent = '<p>' + title + '</p>';
            iwContent += '<img style="width:150px;" src="<c:url value="/img/'+img+'"/> ">';
            let iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });
            kakao.maps.event.addListener(marker, 'mouseover', overHandler(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', outHandler(infowindow));
            kakao.maps.event.addListener(marker, 'click', clickHandler(target));

            function clickHandler(target) {
                return function () {

                    location.href = '<c:url value="/map/go?target='+target+'"/> ';
                };
            };

            function overHandler(map, marker, infowindow) {
                return function () {
                    infowindow.open(map, marker);
                };
            };

            function outHandler(infowindow) {
                return function () {
                    infowindow.close();
                };
            };
            this.markers(target, map);
        },
        markers: function (target, map) {
            // lat, lng, title, img, code
            let datas = [];
            $.ajax({
                url: '/getmarkers',
                data: {
                    target: target
                },
                async: false,
                success: function (data) {
                    datas = data;
                }
            })
            let restaurantMarker = '<c:url value="/img/restaurantMarker.png"/> ';
            $('#ms').empty();

            $(datas).each(function (index, item) {
                let imgsize = new kakao.maps.Size(50, 50);
                let markerimg = new kakao.maps.MarkerImage(restaurantMarker, imgsize);
                let markerposition = new kakao.maps.LatLng(item.lat, item.lng);
                let marker = new kakao.maps.Marker({
                    map: map,
                    position: markerposition,
                    image: markerimg
                });
                let iwContent = '<p>' + item.title + '</p>';
                iwContent += '<img style="width:150px;" src="' + item.img + '">';
                let iwPosition = new kakao.maps.LatLng(item.lat, item.lng); //인포윈도우 표시 위치입니다
                let infowindow = new kakao.maps.InfoWindow({
                    position: iwPosition,
                    content: iwContent
                });
                kakao.maps.event.addListener(marker, 'mouseover', overHandler(map, marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', outHandler(infowindow));
                kakao.maps.event.addListener(marker, 'click', clickHandler(item.code));

                function clickHandler(target) {
                    return function () {

                        location.href = '<c:url value="/map/go?target='+target+'"/> ';
                    };
                };

                function overHandler(map, marker, infowindow) {
                    return function () {
                        infowindow.open(map, marker);
                    };
                };

                function outHandler(infowindow) {
                    return function () {
                        infowindow.close();
                    };
                };

                let content = '<p>' + '<a href="/map/go?target=' + item.code + '">' + item.code + '</a>' + ' ' + item.title + '</p>';
                $('#ms').append(content + '<br>');
            });

        }
    };

    $(function () {
        map3.init();
    });
</script>
<div class="col-sm-9">

    <h2>Map3 Page</h2>
    <button id="sbtn">Seoul</button>
    <button id="bbtn">Busan</button>
    <button id="jbtn">Jeju</button>
    <div class="row">
        <div class="col-sm-9">
            <div id="map"></div>
        </div>
        <div class="col-sm-3">
            <div id="ms"></div>
        </div>
    </div>

</div>