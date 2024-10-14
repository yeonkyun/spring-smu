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
    let map1 = {
        map: null,
        marker: null,
        infoWindow: null,
        locations: {
            sunmoon: {
                name: "선문대학교",
                lat: 36.799165,
                lng: 127.074981,
                link: "https://sunmoon.ac.kr",
                img: "https://lh3.googleusercontent.com/p/AF1QipM-zxiDMxxsUt86aICXCEsD1idCVz8EKImhnjTW=s1360-w1360-h1020-c"
            },
            seoul: {
                name: "서울",
                lat: 37.5662952,
                lng: 126.9779451,
                link: "https://www.seoul.go.kr",
                img: "https://love.seoul.go.kr/tmda/Pds/Board/seoul_news_write/201712_06_1.jpg"
            },
            busan: {
                name: "부산",
                lat: 35.1795543,
                lng: 129.0756416,
                link: "https://www.busan.go.kr",
                img: "https://www.visitbusan.net/uploadImgs/files/cntnts/20200102184132612"
            },
            jeju: {
                name: "제주",
                lat: 33.489011,
                lng: 126.498302,
                link: "https://www.jeju.go.kr",
                img: "https://cdn.san.chosun.com/news/photo/201911/13272_55951_153.jpg"
            }
        },
        init() {
            this.createMap();
            this.setupEventListeners();
        },
        createMap() {
            const container = document.getElementById('map');
            const options = {
                center: new kakao.maps.LatLng(36.799797, 127.078852),
                level: 3
            };
            this.map = new kakao.maps.Map(container, options);

            this.addMapControls();
            this.createMarkerInfoWindow(this.locations.sunmoon);
        },
        addMapControls() {
            this.map.addControl(new kakao.maps.MapTypeControl(), kakao.maps.ControlPosition.TOPRIGHT);
            this.map.addControl(new kakao.maps.ZoomControl(), kakao.maps.ControlPosition.RIGHT);
        },
        createMarkerInfoWindow(location) {
            const position = new kakao.maps.LatLng(location.lat, location.lng);
            this.marker = new kakao.maps.Marker({position});
            this.marker.setMap(this.map);

            const content = '<div style="padding: 5px; width: 300px; word-wrap: break-word; text-align: center;">' +
                '<h3 style="margin-top: 0; margin-bottom: 5px;">' + location.name + '</h3>' +
                '<img src="' + location.img + '" style="width: 100%; max-width: 290px; height: auto; margin-bottom: 10px;">' +
                '<a href="' + location.link + '" target="_blank">공식 웹사이트 방문</a>' +
                '</div>';

            this.infoWindow = new kakao.maps.InfoWindow({
                content: content,
                removable: true,
                width: 300,
                height: 200
            });


            kakao.maps.event.addListener(this.marker, 'click', () => this.infoWindow.open(this.map, this.marker));
        },
        moveMap(locationName) {
            const location = this.locations[locationName];
            const moveLatLng = new kakao.maps.LatLng(location.lat, location.lng);
            this.map.panTo(moveLatLng);
            this.updateMarkerInfoWindow(location);
        },
        updateMarkerInfoWindow(location) {
            this.marker.setMap(null);
            if (this.infoWindow) {
                this.infoWindow.close();
            }
            this.createMarkerInfoWindow(location);
        },
        setupEventListeners() {
            document.getElementById("seoul").addEventListener('click', () => this.moveMap('seoul'));
            document.getElementById("busan").addEventListener('click', () => this.moveMap('busan'));
            document.getElementById("jeju").addEventListener('click', () => this.moveMap('jeju'));
        }
    };

    $(function () {
        map1.init();
    });
</script>
<div class="col-sm-9">
    <h2>지도 실습 예제 1</h2>
    <div class="btn-group float-right" style="margin-bottom: 10px">
        <button id="seoul" class="btn btn-outline-secondary">서울</button>
        <button id="busan" class="btn btn-outline-secondary">부산</button>
        <button id="jeju" class="btn btn-outline-secondary">제주</button>
    </div>
    <div id="map" style="width: 100%; height: 500px;"></div>
</div>