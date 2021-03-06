<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/customer/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
    <!--头部-->
	<jsp:include page="common/public-header.jsp"></jsp:include>

    <!-- 轮播图 -->
    <div class="carousel-box">
        <div id="imgCircle" class="carousel slide" data-ride="carousel" data-interval="3000">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#imgCircle" data-slide-to="0" class="active"></li>
                <li data-target="#imgCircle" data-slide-to="1"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="${pageContext.request.contextPath }/images/carousel/car-1.jpg" alt="First slide" style="width: 1600px; height: 530px;">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath }/images/carousel/car-2.jpg" alt="Second slide" style="width: 1400px; height: 530px;">
                </div>
            </div>
            <!-- 轮播（Carousel）导航：就是左右箭头，可省略 -->
            <a class="carousel-control left" href="#imgCircle"
               data-slide="prev">‹
            </a>
            <a class="carousel-control right" href="#imgCircle"
               data-slide="next">›
            </a>
        </div>
    </div>

    <!--<div class="index-carousel">
        <div class="index-carousel-bg">
        </div>
        <div class="index-choice">
            <div class="choice-nav clearfloat">
                <div class="nav-common nav-random left-float"><p class="nav-text">上门取送</p></div>
                <div class="nav-common nav-specify left-float"><p class="nav-text">到店取还</p></div>
                <div class="nav-common nav-discount left-float"><p class="nav-text">特价优惠</p></div>
            </div>
            <div class="choice-address">
                <div class="choice-address-block"><span class="address-text get-address-text">取车</span><input readonly class="address-choice" placeholder="请输入送车上门地址"></div>
                <div class="choice-address-block"><span class="address-text return-address-text">还车</span><input readonly class="address-choice" placeholder="请输入上门取车地址"></div>
            </div>
            <div class="choice-date">
                <span class="date-text">租期</span><input readonly placeholder="请选择开始日期" class="date-choice" type="text">
                &lt;!&ndash;<span class="date-to-bg"></span>&ndash;&gt;
                <img src="${pageContext.request.contextPath }/images/dateTo.png" alt="至">
                <input readonly  placeholder="请选择结束日期" class="date-choice return-date-choice" type="text">
            </div>
            <input type="submit" class="choice-btn" value="立即选车">
        </div>
    </div>-->

    <div class="index-tab">
        <table class="public-container index-tab-box">
            <tr>
                <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath }/images/tab-model.png"></div></td>
                <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath }/images/tab-store.png"></div></td>
                <td><div class="index-tab-common"><img class="tab-img-common" src="${pageContext.request.contextPath }/images/tab-insurance.png"></div></td>
                <td><div class="index-tab-common index-tab-infinite"><img class="tab-img-common" src="${pageContext.request.contextPath }/images/tab-infinite.png"></div></td>
            </tr>
        </table>
    </div>
    <div class="index-content">
        <div class="public-container index-content-box">
            <div class="choice-common">
                <p class="choice-title">短租自驾</p>
                <div class="choice-img-common choice-img-1"></div>
                <p class="choice-desc">24小时轻松取 / 还车</p>
                <button class="choice-btn" onclick="javascript:window.location.href='carList.html'">我要租车</button>
            </div><!--
             --><div class="choice-common">
                <p class="choice-title">敬请期待</p>
                <div class="choice-img-common choice-img-2"></div>
                <p class="choice-desc">敬请期待</p>
                <button class="choice-btn">敬请期待</button>
            </div><!--
            --><div class="choice-common">
                <p class="choice-title">敬请期待</p>
                <div class="choice-img-common choice-img-3"></div>
                <p class="choice-desc">敬请期待</p>
                <button class="choice-btn">敬请期待</button>
            </div><!--
            --><div class="choice-common choice-final">
                <p class="choice-title">敬请期待</p>
                <div class="choice-img-common choice-img-4"></div>
                <p class="choice-desc">敬请期待</p>
                <button class="choice-btn">敬请期待</button>
            </div><!--
            -->
        </div>

    </div>

    <!--尾部-->
	<jsp:include page="common/public-footer.jsp"></jsp:include>

    <script>
        /*$('.date-choice').datetimepicker({
            autoclose: true,
            startDate: new Date()
        });*/
    </script>
</body>
</html>
