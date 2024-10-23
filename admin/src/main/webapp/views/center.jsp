<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let center_websocket = {
        stompClient: null,
        init: function () {
            let socket = new SockJS('${serverurl}/wss');
            this.stompClient = Stomp.over(socket);
            console.log('Start -------');

            this.stompClient.connect({}, function (frame) {
                console.log(frame);
                this.subscribe('/send2', function (msg) {
                    console.log(msg);
                    console.log(typeof (msg));
                    console.log(msg.content1);
                    console.log(JSON.parse(msg.body).content1);
                    $('#msg1').text(JSON.parse(msg.body).content1);
                    $('#msg2').text(JSON.parse(msg.body).content2);
                    $('#msg3').text(JSON.parse(msg.body).content3);
                    $('#msg4').text(JSON.parse(msg.body).content4);
                    $('#progress1').css('width', JSON.parse(msg.body).content1 / 100 * 100 + '%');
                    $('#progress1').attr('aria-valuenow', JSON.parse(msg.body).content1 / 100 * 100);
                    $('#progress2').css('width', JSON.parse(msg.body).content2 / 1000 * 100 + '%');
                    $('#progress2').attr('aria-valuenow', JSON.parse(msg.body).content2 / 1000 * 100);
                    $('#progress3').css('width', JSON.parse(msg.body).content3 / 500 * 100 + '%');
                    $('#progress3').attr('aria-valuenow', JSON.parse(msg.body).content3 / 500 * 100);
                    $('#progress4').css('width', JSON.parse(msg.body).content4 / 10 * 100 + '%');
                    $('#progress4').attr('aria-valuenow', JSON.parse(msg.body).content4 / 10 * 100);
                });
            });
        }
    };
    let center = {
        livedata:null,
        init:function(){
            this.getdata();
            this.display2();
            setInterval(()=>{
                this.getdata();
            },5000);
        },
        getdata:function(){
            $.ajax({
                url:'/charts/chart1',
                success:(datas)=>{
                    this.display(datas);
                }
            });
        },
        display2:function(){
            const onChartLoad = function () {
                const chart = this,
                    series = chart.series[0];

                setInterval(function () {
                    $.ajax({
                        url:'/charts/chart1',
                        success:(datas)=>{
                            console.log(new Date(datas.endtime).getTime()+'  :  '+datas.endline);
                            series.addPoint([new Date(datas.endtime).getTime(), datas.endline],
                                true, true);
                        }
                    });
                }, 1000);
            };

            // Create the initial data
            const data = (function () {
                const data = [];
                const time = new Date().getTime();

                for (let i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: Math.random()
                    });
                }
                return data;
            }());

            // Plugin to add a pulsating marker on add point
            Highcharts.addEvent(Highcharts.Series, 'addPoint', e => {
                const point = e.point,
                    series = e.target;

                if (!series.pulse) {
                    series.pulse = series.chart.renderer.circle()
                        .add(series.markerGroup);
                }

                setTimeout(() => {
                    series.pulse
                        .attr({
                            x: series.xAxis.toPixels(point.x, true),
                            y: series.yAxis.toPixels(point.y, true),
                            r: series.options.marker.radius,
                            opacity: 1,
                            fill: series.color
                        })
                        .animate({
                            r: 20,
                            opacity: 0
                        }, {
                            duration: 1000
                        });
                }, 1);
            });


            Highcharts.chart('live_chart', {
                chart: {
                    type: 'spline',
                    events: {
                        load: onChartLoad
                    }
                },

                time: {
                    useUTC: false
                },

                title: {
                    text: 'Live random data'
                },

                accessibility: {
                    announceNewData: {
                        enabled: true,
                        minAnnounceInterval: 15000,
                        announcementFormatter: function (allSeries, newSeries, newPoint) {
                            if (newPoint) {
                                return 'New point added. Value: ' + newPoint.y;
                            }
                            return false;
                        }
                    }
                },

                xAxis: {
                    type: 'datetime',
                    tickPixelInterval: 150,
                    maxPadding: 0.1
                },

                yAxis: {
                    title: {
                        text: 'Value'
                    },
                    plotLines: [
                        {
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }
                    ]
                },

                tooltip: {
                    headerFormat: '<b>{series.name}</b><br/>',
                    pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
                },

                legend: {
                    enabled: false
                },

                exporting: {
                    enabled: false
                },

                series: [
                    {
                        name: 'Random data',
                        lineWidth: 2,
                        color: Highcharts.getOptions().colors[2],
                        data
                    }
                ]
            });
        },
        display:function(datas){
            Highcharts.chart('default_chart', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: datas.x
                },
                yAxis: {
                    title: {
                        text: 'Temperature (°C)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: datas.result
            });
        }
    };
    $(function () {
        center.init();
        center_websocket.init();
    });
</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
    </div>

    <!-- Content Row -->
    <div class="row">

        <!-- Earnings (Monthly) Card Example -->
        <%--        <div class="col-xl-3 col-md-6 mb-4">--%>
        <%--            <div class="card border-left-primary shadow h-100 py-2">--%>
        <%--                <div class="card-body">--%>
        <%--                    <div class="row no-gutters align-items-center">--%>
        <%--                        <div class="col mr-2">--%>
        <%--                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">--%>
        <%--                                Earnings (Monthly)</div>--%>
        <%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="col-auto">--%>
        <%--                            <i class="fas fa-calendar fa-2x text-gray-300"></i>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
        <%--        <div class="col-xl-3 col-md-6 mb-4">--%>
        <%--            <div class="card border-left-success shadow h-100 py-2">--%>
        <%--                <div class="card-body">--%>
        <%--                    <div class="row no-gutters align-items-center">--%>
        <%--                        <div class="col mr-2">--%>
        <%--                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">--%>
        <%--                                Earnings (Annual)</div>--%>
        <%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="col-auto">--%>
        <%--                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>

        <!-- Earnings (Monthly) Card Example -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg1" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress1" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg2" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress2" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg3" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress3" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                            </div>
                            <div class="row no-gutters align-items-center">
                                <div class="col-auto">
                                    <div id="msg4" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                </div>
                                <div class="col">
                                    <div class="progress progress-sm mr-2">
                                        <div id="progress4" class="progress-bar bg-info" role="progressbar"
                                             style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                             aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Pending Requests Card Example -->
        <%--        <div class="col-xl-3 col-md-6 mb-4">--%>
        <%--            <div class="card border-left-warning shadow h-100 py-2">--%>
        <%--                <div class="card-body">--%>
        <%--                    <div class="row no-gutters align-items-center">--%>
        <%--                        <div class="col mr-2">--%>
        <%--                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">--%>
        <%--                                Pending Requests</div>--%>
        <%--                            <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>--%>
        <%--                        </div>--%>
        <%--                        <div class="col-auto">--%>
        <%--                            <i class="fas fa-comments fa-2x text-gray-300"></i>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="default_chart">

                    </div>
                </div>
            </div>
        </div>

        <!-- Live Chart Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div id="live_chart"></div>
                </div>
            </div>
        </div>
    </div>


</div>
