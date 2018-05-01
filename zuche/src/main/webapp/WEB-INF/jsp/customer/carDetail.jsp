<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>车辆详情</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/jquery.raty.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/css/carDetail.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HHNwksT3c9XuGE9iwPrL0LLgSF0KzQsg"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.raty.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/carDetail.js"></script>
</head>
<body>
    <!--头部-->
	<jsp:include page="../common/public-header.jsp"></jsp:include>

    <div class="main-content">
        <div class="public-container clearfloat">
            <div class="car-desc-box left-float">
                <div class="car-title">别克英朗/三厢/1.5自动</div>
                <div class="car-img-box">
                    <img class="car-img-big" src="${pageContext.request.contextPath}/images/car-show-1.jpg">
                    <ul class="clearfloat car-img-small-box">
                        <li class="left-float"><a href="javascript:void(0)" onclick="changeCarImg(this);"><img class="car-img-small" src="${pageContext.request.contextPath}/images/car-show-1.jpg"></a></li>
                        <li class="left-float"><a href="javascript:void(0)" onclick="changeCarImg(this);"><img class="car-img-small" src="${pageContext.request.contextPath}/images/car-show-2.jpg"></a></li>
                        <li class="left-float"><a href="javascript:void(0)" onclick="changeCarImg(this);"><img class="car-img-small" src="${pageContext.request.contextPath}/images/car-show-3.jpg"></a></li>
                        <li class="left-float"><a href="javascript:void(0)" onclick="changeCarImg(this);"><img class="car-img-small" src="${pageContext.request.contextPath}/images/car-show-4.jpg"></a></li>
                    </ul>
                </div>
                <div class="car-base-info-box">
                    <dl>
                        <dt class="base-info-title">别克英朗租车基本信息</dt>
                        <dd class="base-info-content">
                            <table class="base-info-content-box">
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/brand.png"> 品牌：别克</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/model.png"> 车系：英朗</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/year.png"> 年代：2016</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/conf.png"> 配置：高配款</td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </div>
                <div class="car-base-info-box">
                    <dl>
                        <dt class="base-info-title">别克英朗租车配置信息</dt>
                        <dd class="base-info-content">
                            <table class="base-info-content-box">
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/seat.png"> 座位数：5</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/door.png"> 车门数：4</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/displacement.png"> 排量：1111</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 导航仪：有</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/pdc.png"> 倒车雷达：有</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/driven.png"> 驱动模式：前驱</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/navigator.png"> 油箱：40</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/gear.png"> 变速箱：自动</td>
                                </tr>
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/sky.png"> 天窗：有</td>
                                    <td><img src="${pageContext.request.contextPath}/images/car-conf/cell.png"> 安全气囊：有</td>
                                </tr>
                            </table>
                        </dd>
                    </dl>
                </div>
                <div class="order-btn-box">
                    <button class="order-btn" onclick="location.href='${pageContext.request.contextPath}/toOrderPreview'">立刻预定</button>
                </div>
            </div>
            <div class="car-store left-float">
                <p class="store-name">武汉天河机场店</p>
                <div id="store-map" class="store-map"></div>
                <div class="store-desc">
                    <dl>
                        <dt class="store-title">门店地址：</dt>
                        <dd class="store-content">T3航站楼国内到达二楼7号出口左面柜台</dd>
                        <dt class="store-title">营业时间：</dt>
                        <dd class="store-content">09:00-21:00</dd>
                        <dt class="store-title">门店电话：</dt>
                        <dd class="store-content">13432825705</dd>
                        <dt class="store-title">客户评价：</dt>
                        <dd class="store-content clearfloat"><div class="comment-star left-float"></div>&nbsp;<span class="orange-text">3.0</span><a href="#" class="total-comment right-float">3000000条评论&gt;</a></dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <!--尾部-->
	<jsp:include page="../common/public-footer.jsp"></jsp:include>

    <script>
        // 星星
        $('.comment-star').raty({
            starOn:'${pageContext.request.contextPath}/images/star-on.png',
            starOff:'${pageContext.request.contextPath}/images/star-off.png',
            halfShow: false,
            score:3,
            readOnly: true,
        });

        $(function() {
            var map = new BMap.Map("store-map");
            var point = new BMap.Point(116.404, 39.915);  // 根据经纬度设置中心点:天安门
            map.centerAndZoom(point,12);  // 设置中心点和缩放级别，数字越大，显示的范围越小
            map.enableScrollWheelZoom();  // 支持滚轮缩放
            // map.addControl(new BMap.NavigationControl());  // 左上角添加平移缩放控件
            // map.addControl(new BMap.ScaleControl());  // 左下方显示比例
            // 根据地址在地图上显示
            var myGeo = new BMap.Geocoder();
            myGeo.getPoint("武汉天河机场", function(point) {
                if (point) {
                    map.centerAndZoom(point, 17);
                    map.addOverlay(new BMap.Marker(point));    // 标注
                }
            });
        });

    </script>
</body>
</html>
