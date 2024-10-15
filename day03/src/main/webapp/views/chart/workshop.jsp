<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 15.
  Time: 오후 10:36
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
        height: 450px;
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
    let chart2 = {
        salesData: null,
        init() {
            this.getData();
        },
        getData() {
            $.ajax({
                url: '/charts/workshop',
                success: (data) => {
                    this.salesData = data;
                    this.bindEvents();
                    this.display(2020);
                }
            });
        },
        bindEvents() {
            $('.btn-group .btn').on('click', (e) => {
                const year = $(e.target).text();
                this.display(parseInt(year));
            });
        },
        display(year) {
            if (!this.salesData) return;

            Highcharts.chart('container', {
                chart: {
                    type: 'area'
                },
                title: {
                    text: `${year}년도 월별 남녀 매출`
                },
                xAxis: {
                    categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    tickmarkPlacement: 'on',
                    title: {
                        enabled: false
                    }
                },
                yAxis: {
                    title: {
                        text: '매출 (원)'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + 'k';
                        }
                    }
                },
                tooltip: {
                    split: true,
                    valueSuffix: ' 원'
                },
                plotOptions: {
                    area: {
                        stacking: 'normal',
                        lineColor: '#666666',
                        lineWidth: 1,
                        marker: {
                            lineWidth: 1,
                            lineColor: '#666666'
                        }
                    }
                },
                series: [{
                    name: '남자',
                    data: this.salesData['남자'][year]
                }, {
                    name: '여자',
                    data: this.salesData['여자'][year]
                }]
            });
        }
    }

    $(function () {
        chart2.init();
    })
</script>
<div class="col-sm-9">
    <h2>통계 차트 워크숍</h2>
    <li>화면에서 2020년부터 2024년까지 월별 남자, 여자 매출을 SELECT FORM 구성.</li>
    <li style="margin-bottom: 10px">연도별 버튼 클릭 시 각 연도에 대한 월별 정보 출력.</li>
    <div class="btn-group btn-block">
        <button class="btn btn-outline-secondary">2020</button>
        <button class="btn btn-outline-secondary">2021</button>
        <button class="btn btn-outline-secondary">2022</button>
        <button class="btn btn-outline-secondary">2023</button>
        <button class="btn btn-outline-secondary">2024</button>
    </div>
    <figure class="highcharts-figure">
        <div id="container"></div>
    </figure>
</div>