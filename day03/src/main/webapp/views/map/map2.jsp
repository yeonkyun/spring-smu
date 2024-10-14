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
        width: 600px;
        height: 500px;
        border: 2px solid darkred;
    }
</style>
<script>
    let map2 = {
        init: function () {
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
                level: 6
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
                    location.href = '<c:url value="/map/go?target=' + target + '"/>';
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
            // lat, lng
            let datas = [];
            if (target == 100) {
                datas = [
                    {
                        lat: 37.564472,
                        lng: 126.990841,
                        title: '순대국',
                        img: 'https://i.namu.wiki/i/rtZibA-wsYbxXx-REXpbOeFWZyKHfKYRynsRv-HeT6Wx-A3X2XOCjSALqPm9zbNzI308ZD3XgCUhRndkaAY7gvqJLx8BkYsFL_yPkHjQeFH-xZXFawushf6E62NA-lSLtCuuKB6iW-xPZ-2ziwfqzpw-57fLlhEk_LOrTJwoBus.webp',
                        code: 101
                    },
                    {
                        lat: 37.544472,
                        lng: 126.970841,
                        title: '떡볶이',
                        img: 'https://i.namu.wiki/i/rtZibA-wsYbxXx-REXpbOVZAbn_ASkINGTRHWvG0tJj2aTQ4bmkRamzY7IoJ1bvzaSvSjPnxA3Yzp4litB6C0A4s378c4-ZWMaKFJcToSsVDxruOkaYVuCAdUJgY0GkihJV6S3ON0lP7dtqZTsW5XSOISdrp-S8T5VIACGUcQQE.webp',
                        code: 102
                    },
                    {
                        lat: 37.564472,
                        lng: 126.970841,
                        title: '김밥',
                        img: 'https://i.namu.wiki/i/c6mkjhkWcby7klDJUTqFuHIZ5VsbCSRyZ4x-4LnJM7CDTrJ31qTW2WeIDj73jIhMJCoeryqomuLtprV2qVg0AcP27fKPWTHMQw0J47cHDp5XPP_KLfmVmW-N-LhkfWeZtkLBzDSYmvotyqQXPxYpKy_EWu-57mn5u6QIliM7v_4.webp',
                        code: 103
                    }
                ]
            } else if (target == 200) {
                datas = [
                    {
                        lat: 35.185109,
                        lng: 129.175474,
                        title: '밀면',
                        img: 'https://blog.kakaocdn.net/dn/bdx7Cs/btsICo5MbcT/sYHlzNnUKqfKniyfxEpHc0/img.jpg',
                        code: 201
                    },
                    {
                        lat: 35.165109,
                        lng: 129.185474,
                        title: '돼지국밥',
                        img: 'https://sitem.ssgcdn.com/92/76/94/item/1000179947692_i1_750.jpg',
                        code: 202
                    },
                    {
                        lat: 35.175109,
                        lng: 129.185474,
                        title: '씨앗호떡',
                        img: 'https://thenaum.cdn-nhncommerce.com/data/goods/18/03/13/1000001621/1000001621_detail_071.jpg',
                        code: 203
                    }
                ]
            } else if (target == 300) {
                datas = [
                    {
                        lat: 33.264564,
                        lng: 126.560944,
                        title: '흑돼지',
                        img: 'https://pimg.mk.co.kr/meet/neds/2021/04/image_readtop_2021_386417_16190316624618254.jpg',
                        code: 301
                    },
                    {
                        lat: 33.244564,
                        lng: 126.560944,
                        title: '돔베국수',
                        img: 'https://thenaum.cdn-nhncommerce.com/data/goods/20/03/12/1000002856/1000002856_detail_089.jpg',
                        code: 302
                    },
                    {
                        lat: 33.254564,
                        lng: 126.570944,
                        title: '갈치조림',
                        img: 'https://recipe1.ezmember.co.kr/cache/recipe/2022/09/04/37a1f64e7f0b5d2b5f89e92c4ef33a371.jpg',
                        code: 303
                    }
                ]
            } else {

            }
            let restaurantMarker = '<c:url value="/img/restaurantMarker.png"/>';

            $(datas).each((idx, item) => {
                let imgsize = new kakao.maps.Size(50, 50);
                let markerImage = new kakao.maps.MarkerImage(restaurantMarker, imgsize);
                let markerPosition = new kakao.maps.LatLng(item.lat, item.lng);
                let marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    image: markerImage
                });
                let iwContent = '<p>' + item.title + '</p>';
                iwContent += '<img style="width:150px;" src="' + item.img + '">';
                let iwPosition = new kakao.maps.LatLng(item.lat, item.lng); //인포윈도우 표시 위치입니다
                let infowindow = new kakao.maps.InfoWindow({
                    position: iwPosition,
                    content: iwContent
                });
                kakao.maps.event.addListener(marker, 'mouseover', () => infowindow.open(map, marker));
                kakao.maps.event.addListener(marker, 'mouseout', () => infowindow.close());
                kakao.maps.event.addListener(marker, 'click', () => location.href = '<c:url value="/map/go?target=' + item.code + '"/>');
            })
        }
    };
    $(function () {
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