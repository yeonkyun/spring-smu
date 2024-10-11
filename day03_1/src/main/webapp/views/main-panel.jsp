<%--
  Created by IntelliJ IDEA.
  User: yeonkyun
  Date: 24. 10. 10.
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-sm-6">
                <h3 class="mb-0 font-weight-bold">&nbsp;</h3>
                <p>&nbsp;</p>
            </div>
            <div class="col-sm-6">
                <div class="d-flex align-items-center justify-content-md-end">
                    <div class="mb-3 mb-xl-0 pr-1">
                        <div class="dropdown">
                            <button class="btn bg-white btn-sm dropdown-toggle btn-icon-text border mr-2"
                                    type="button"
                                    id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <i class="typcn typcn-calendar-outline mr-2"></i>추가 예정
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3"
                                 data-x-placement="top-start">
                                <h6 class="dropdown-header">추가 예정</h6>
                                <a class="dropdown-item" href="#">추가 예정</a>
                                <a class="dropdown-item" href="#">추가 예정</a>
                            </div>
                        </div>
                    </div>
                    <div class="pr-1 mb-3 mr-2 mb-xl-0">
                        <button id="export_btn" type="button" class="btn btn-sm bg-white btn-icon-text border">
                            <i
                                    class="typcn typcn-arrow-forward-outline mr-2"></i>내보내기
                        </button>
                    </div>
                    <div class="pr-1 mb-3 mb-xl-0">
                        <button type="button" class="btn btn-sm bg-white btn-icon-text border"><i
                                class="typcn typcn-info-large-outline mr-2"></i>정보
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 d-flex grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="chart-container mt-4">
                                    <!-- 차트 생성 부분 -->
                                    <canvas id="areachart-multi"></canvas>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="mt-4">
                                    <div class="d-flex mb-3">
                                        <div class="text-success font-weight-bold today-date"></div>
                                        <div class="text-success font-weight-bold">&nbsp;기준 거래 데이터</div>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-between mb-3">
                                        <div class="font-weight-medium">금일 거래 완료 수</div>
                                        <div class="text-muted" id="today-successed"></div>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <div class="font-weight-medium">금일 거래 실패 수</div>
                                        <div class="text-muted" id="today-failed"></div>
                                    </div>
                                    <hr>
                                    <div class="mt-4">
                                        <div class="d-flex justify-content-between mb-3">
                                            <div class="font-weight-medium">총 거래 완료 수</div>
                                            <div class="text-muted" id="total-successed"></div>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <div class="font-weight-medium">총 거래 실패 수</div>
                                            <div class="text-muted" id="total-failed"></div>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper 끝 -->
</div>