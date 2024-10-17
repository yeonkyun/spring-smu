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
    .highcharts-figure,
    .highcharts-data-table table {
        min-width: 320px;
        max-width: 800px;
        margin: 1em auto;
    }

    #container {
        height: 400px;
    }

    .highcharts-data-table table {
        font-family: Verdana, sans-serif;
        border-collapse: collapse;
        border: 1px solid #ebebeb;
        margin: 10px auto;
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
    }

    .highcharts-data-table th {
        font-weight: 600;
        padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
        padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
        background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
        background: #f1f7ff;
    }
</style>
<script>
    $(function () {
        // 차트가 로드될 때 실행되는 함수
        const onChartLoad = function () {
            const chart = this, // 'this'는 현재 차트 객체를 참조
                series = chart.series[0]; // 첫 번째 데이터 시리즈를 가져옴

            // 1초마다 새로운 데이터 포인트를 추가하는 인터벌 설정
            setInterval(function () {
                const x = (new Date()).getTime(), // 현재 시간을 밀리초로 가져옴
                    y = Math.random(); // 0과 1 사이의 랜덤 값 생성

                // 새 포인트를 추가하고, 가장 오래된 포인트를 제거
                // true: 차트 즉시 갱신, true: 배열 크기 유지(가장 오래된 포인트 제거)
                series.addPoint([x, y], true, true);
            }, 1000); // 1000ms = 1초 간격으로 실행
        };

        // 초기 데이터 생성 함수 (즉시 실행 함수)
        const data = (function () {
            const data = [];
            const time = new Date().getTime(); // 현재 시간을 밀리초로 가져옴

            // 현재 시간부터 19초 전까지의 랜덤 데이터 생성
            for (let i = -19; i <= 0; i += 1) {
                data.push({
                    x: time + i * 1000, // 1초 간격으로 과거 시간 설정
                    y: Math.random() * 100 // 0에서 100 사이의 랜덤 값
                });
            }
            return data;
        }());

        // 새 포인트가 추가될 때마다 실행되는 이벤트 핸들러
        Highcharts.addEvent(Highcharts.Series, 'addPoint', e => {
            const point = e.point, // 새로 추가된 포인트
                series = e.target; // 해당 포인트가 속한 시리즈

            // 펄스 효과를 위한 원 생성 (처음 한 번만 실행)
            if (!series.pulse) {
                series.pulse = series.chart.renderer.circle()
                    .add(series.markerGroup);
            }

            // 펄스 애니메이션 설정 (1ms 지연 후 실행)
            setTimeout(() => {
                series.pulse
                    .attr({
                        x: series.xAxis.toPixels(point.x, true), // X 좌표
                        y: series.yAxis.toPixels(point.y, true), // Y 좌표
                        r: series.options.marker.radius, // 초기 반지름
                        opacity: 1, // 초기 불투명도
                        fill: series.color // 시리즈 색상으로 채우기
                    })
                    .animate({
                        r: 20, // 최종 반지름
                        opacity: 0 // 최종 불투명도 (완전 투명)
                    }, {
                        duration: 1000 // 애니메이션 지속 시간 (1초)
                    });
            }, 1);
        });

        // Highcharts 차트 설정 및 생성
        Highcharts.chart('container', {
            chart: {
                type: 'spline', // 부드러운 곡선 차트
                events: {
                    load: onChartLoad // 차트 로드 시 실행할 함수
                }
            },

            time: {
                useUTC: false // 로컬 시간 사용 (UTC 시간 사용 안 함)
            },

            title: {
                text: '실시간 랜덤 전력 데이터'
            },

            // 접근성 설정
            accessibility: {
                announceNewData: {
                    enabled: true, // 새 데이터 발표 기능 활성화
                    minAnnounceInterval: 15000, // 최소 발표 간격 (15초)
                    announcementFormatter: function (allSeries, newSeries, newPoint) {
                        if (newPoint) {
                            return 'New point added. Value: ' + newPoint.y;
                        }
                        return false;
                    }
                }
            },

            // X축 설정
            xAxis: {
                type: 'datetime', // 날짜/시간 형식의 X축
                tickPixelInterval: 150, // 눈금 간격 (픽셀)
                maxPadding: 0.1 // 최대 패딩 (오른쪽 여백)
            },

            // Y축 설정
            yAxis: {
                title: {
                    text: '전력량(W)'
                },
                plotLines: [
                    {
                        value: 0, // Y축 0 위치에 선 그리기
                        width: 1,
                        color: '#808080'
                    }
                ]
            },

            // 툴팁 설정
            tooltip: {
                headerFormat: '<b>{series.name}</b><br/>',
                pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
            },

            legend: {
                enabled: false // 범례 비활성화
            },

            exporting: {
                enabled: false // 내보내기 기능 비활성화
            },

            // 데이터 시리즈 설정
            series: [
                {
                    name: '랜덤 전력 데이터',
                    lineWidth: 2, // 선 두께
                    color: Highcharts.getOptions().colors[2], // 색상 설정 (3번째 기본 색상)
                    data // 초기 데이터 (위에서 생성한 data 배열)
                }
            ]
        });
    });
</script>
<div class="col-sm-9">
    <h2>통계 차트 실습 예제 2</h2>
    <figure class="highcharts-figure">
        <div id="container"></div>
    </figure>
</div>