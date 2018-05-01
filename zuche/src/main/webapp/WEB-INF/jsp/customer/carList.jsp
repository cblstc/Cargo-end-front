<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>选车列表</title>
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap-theme.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/jquery.raty.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/jquery-ui.min.css">

    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/reset.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/common.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/showMap.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/customer/carList.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/pagenator/pagination.css">
    <link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath }/css/common/comment.css">

    <style>
        .choice-date-block, .choice-address-block {
            position: relative;
        }
        /* 设置错误提示的样式和位置 */
        label.error {
            position: absolute;
            right: 10px;
            top: 10px;
            color: #ef392b;
            font-size: 12px;
        }
        /* 处理评分星星空格宽度太大 */
        .comment-pl-block img {
            margin-right: -8px;
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HHNwksT3c9XuGE9iwPrL0LLgSF0KzQsg"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery.raty.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/customer/carList.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/pagenator/jquery.pagination.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common/jquery.validation/1.14.0/messages_zh.js"></script>
    <script>

    </script>
</head>
<body>
    <!--头部-->
    <jsp:include page="../common/public-header.jsp"></jsp:include>


    <div class="address-date-choice">
        <form action="#" id="date-choice-form" method="post">
        <div class="public-container clearfloat">
            <img class="left-float car-to-img" src="${pageContext.request.contextPath }/images/car-to.jpg">
            <div class="choice-date left-float">
                <div class="choice-date-block"><span class="date-text">取车时间</span><!--
                --><input readonly required placeholder="请选择开始日期" class="date-choice get-date-choice" name="gettime" type="text"></div>
                <div class="choice-date-block"><span class="date-text">还车时间</span><!--
                --><input readonly required placeholder="请选择结束日期" class="date-choice return-date-choice" name="returntime" type="text"></div>
            </div>
            <img class="date-to-img left-float" src="${pageContext.request.contextPath }/images/dateToV.png" alt="至">
            <div class="choice-address left-float">
                <div class="choice-address-block">
                    <span class="address-text get-address-text">门店选择</span><!--
                --><input readonly required class="address-choice storename" placeholder="请选择一个门店" onclick="openMap($('.storename').val())">
                </div>
                <div class="choice-address-block">
                    <span class="address-text return-address-text">当前门店：&nbsp;<span class="red-text">武汉天河门店</span></span>
                </div>
            </div>
            <div class="choice-submit clearfloat">
                <p class="rent-time">租期：<span class="red-text rentdays">??</span>天
                    <i class="rent-time-info glyphicon glyphicon-info-sign" title="关于租期的约定：<br/>
                        1. 取车时间应在当前时间4个小时后<br/>
                        2. 租车时长不低于4个小时<br/>
                        租期的计算方式：<br/>
                        超过4个小时算一天，例：1天4小时的租期为两天，1天3小时的租期为一天"></i></p>
                <input type="submit" class="choice-btn" value="立即选车">
                <!--@Todo 根据门店名称查询门店的信息，然后跳转到carList页面-->
            </div>
        </div>
        </form>
    </div>

    <!--中间的选车部分-->
    <div class="car-select">
        <div class="public-container clearfloat">
            <div class="car-filter left-float">
                <div class="car-price">
                    <p class="price-title">价格<span class="grey-text size14">(元)</span></p>
                    <div class="price-line">
                        <a href="javascript:void(0)" onclick="selectPrice(this, '.price-no-filter', '');"><div class="price-line-common price-line-1"></div></a><!--
                        --><a href="javascript:void(0)" onclick="selectPrice(this, '.price-0', '.price-150');"><div class="price-line-common price-line-2"></div></a><!--
                        --><a href="javascript:void(0)" onclick="selectPrice(this, '.price-150', '.price-300');"><div class="price-line-common price-line-3"></div></a><!--
                        --><a href="javascript:void(0)" onclick="selectPrice(this, '.price-300', '.price-500');"><div class="price-line-common price-line-4"></div></a><!--
                        --><a href="javascript:void(0)" onclick="selectPrice(this, '.price-500-plus', '');"><div class="price-line-common price-line-5"></div></a><!--
                        -->
                    </div>
                    <p class="price-text"><span class="price-no-filter size14">不限</span>&nbsp;<!--
                    --><span class="price-0">0</span>&nbsp;&nbsp;<!--
                        --><span class="price-150">150</span>&nbsp;&nbsp;<!--
                        --><span class="price-300">300</span>&nbsp;&nbsp;<!--
                        --><span class="price-500">500</span>&nbsp;&nbsp;<!--
                        --><span class="price-500-plus">500+</span><!--
                        --></p>
                </div>
                <div class="car-brand">
                    <p class="brand-title">品牌</p>
                    <div class="brand-content">
                        <a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common brand-name-specify">不限</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">大众</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">比亚迪</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">丰田</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">马自达</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">斯巴鲁</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">长安</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">本田</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">日产</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">保时捷</p></a><!--
                        --><a href="javascript:void(0)" onclick="selectBrand(this);"><p class="brand-name-common">大众</p></a><!--
                        -->
                    </div>
                </div>
                <div class="car-store">
                    <p class="store-name">武汉天河机场店</p>
                    <div id="store-map" class="store-map"></div>
                    <div class="store-desc">
                        <dl>
                            <dt class="store-title">门店地址：</dt>
                            <dd class="store-content">T3航站楼国内到达二楼7号出口左面柜台</dd>
                            <dt class="store-title">门店详情：</dt>
                            <dd class="store-content">武汉天河机场店欢迎您</dd>
                            <dt class="store-title">交通指引：</dt>
                            <dd class="store-content">地铁3号线</dd>
                            <dt class="store-title">营业时间：</dt>
                            <dd class="store-content">09:00-21:00</dd>
                            <dt class="store-title">门店电话：</dt>
                            <dd class="store-content">13432825705</dd>
                            <dt class="store-title">客户评价：</dt>
                            <dd class="store-content clearfloat"><div class="comment-star left-float"></div>&nbsp;<span class="orange-text">3.0</span><a href="javascript:void(0)" onclick="showComment('store');" class="total-comment right-float">3000000条评论&gt;</a></dd>
                        </dl>
                    </div>
                </div>
            </div>

            <div class="car-content left-float">
                <!-- 车辆一条记录: start -->
                <div class="single-car clearfloat">
                    <img class="car-img left-float" src="${pageContext.request.contextPath }/images/car-1.jpg">
                    <dl class="car-desc-box left-float">
                        <dt class="car-name">别克英朗</dt>
                        <dd class="car-desc">三厢|1.5自动|5人</dd>
                        <dd class="car-gear-auto">自动挡</dd>
                        <!--<dd class="car-gear">手动挡</dd>-->
                        <dd  class="car-comment"><a href="javascript:void(0)" onclick="showComment('car');">1000条评论</a></dd>
                    </dl>
                    <div class="car-price-box left-float">
                        <span class="car-price-text">&yen;83</span><span class="day-avg">/日均</span>

                    </div>
                    <div class="choice-btn-box left-float">
                        <button class="choice-btn" onclick="javascript:window.open('carDetail.html')">租&nbsp;车</button>
                        <p class="remains">剩余100辆</p>
                    </div>
                </div>
                <!-- 车辆一条记录: end -->
                <!-- 车辆一条记录: start -->
                <div class="single-car clearfloat">
                    <img class="car-img left-float" src="${pageContext.request.contextPath }/images/car-1.jpg">
                    <dl class="car-desc-box left-float">
                        <dt class="car-name">别克英朗</dt>
                        <dd class="car-desc">三厢|1.5自动|5人</dd>
                        <dd class="car-gear-auto">自动挡</dd>
                        <!--<dd class="car-gear">手动挡</dd>-->
                        <dd  class="car-comment"><a href="javascript:void(0)" onclick="showComment();">1000条评论</a></dd>
                    </dl>
                    <div class="car-price-box left-float">
                        <span class="car-price-text">&yen;83</span><span class="day-avg">/日均</span>

                    </div>
                    <div class="choice-btn-box left-float">
                        <button class="choice-btn" onclick="javascript:window.open('carDetail.html')">租&nbsp;车</button>
                        <p class="remains">剩余100辆</p>
                    </div>
                </div>
                <!-- 车辆一条记录: end -->
                <!-- 车辆一条记录: start -->
                <div class="single-car clearfloat">
                    <img class="car-img left-float" src="${pageContext.request.contextPath }/images/car-1.jpg">
                    <dl class="car-desc-box left-float">
                        <dt class="car-name">别克英朗</dt>
                        <dd class="car-desc">三厢|1.5自动|5人</dd>
                        <dd class="car-gear-auto">自动挡</dd>
                        <!--<dd class="car-gear">手动挡</dd>-->
                        <dd  class="car-comment"><a href="javascript:void(0)" onclick="showComment();">1000条评论</a></dd>
                    </dl>
                    <div class="car-price-box left-float">
                        <span class="car-price-text">&yen;83</span><span class="day-avg">/日均</span>

                    </div>
                    <div class="choice-btn-box left-float">
                        <button class="choice-btn" onclick="javascript:window.open('carDetail.html')">租&nbsp;车</button>
                        <p class="remains">剩余100辆</p>
                    </div>
                </div>
                <!-- 车辆一条记录: end -->
                <!-- 车辆分页 start -->
                <div class="clearfloat"><div class="m-style car-pagenator right-float"></div></div>
                <div class="clearfloat">
                    <p class="car-tips right-float">
                        总记录
                        <span class="count">100</span>条，每页显示
                        <span class="count">10</span>条，总页数为
                        <span class="count">10</span>页
                    </p>
                </div>
                <!-- 车辆分页 end -->

            </div>
        </div>
    </div>

    <!--尾部-->
    <jsp:include page="../common/public-footer.jsp"></jsp:include>


    <script>
        /* 显示车辆分页 */
        $('.car-pagenator').pagination({
            totalData: 100, // 总记录数
            showData: 10,    // 每页显示记录数
            mode: 'fixed',  // 固定显示多少页数
            callback: function (api) {  // 回调函数
                console.log(api.getCurrent());  // 当前页数
                // @todo ajax分页
            }
        });

        $(function() {
            // 现在加4个小时
            // var nowPlusFourHours = new Date((new Date() / 1000 / 3600 + 4) * 1000 * 3600);

            $(".rent-time-info").tooltip({
                content: function() {
                    return $(this).attr('title');
                }
            });  // tooltip提示，可以使用<br/>换行

            /* 取车时间：日期选择插件 */
            $('.get-date-choice').datetimepicker({
                autoclose: true,
                startDate: new Date()
            });
            /* 取车时间：日期改变事件 */
            $('.get-date-choice').on("changeDate", function () {
                $('.return-date-choice').val("");  // 还车时间变为空
                $('.return-date-choice').datetimepicker({
                    autoclose: true,
                    // startDate: $('.get-date-choice').val()
                    startDate: new Date()
                });
                $(".rentdays").text("??");
            });
            /* 还车时间：日期改变事件 */
            $('.return-date-choice').on("changeDate", function () {
                var getDate = new Date($('.get-date-choice').val());
                var returnDate = new Date($('.return-date-choice').val());
                var totalHours = (returnDate - getDate) / 1000 / 3600;  // 计算时间间隔：小时
                alert("TotalHours:"+ totalHours);
                if (totalHours % 24 >= 4)
                    var totalDays = Math.floor(totalHours / 24) + 1;  // 向下取整
                else
                    var totalDays = Math.floor(totalHours / 24);
                $(".rentdays").text(totalDays);
            });

            /* 显示评分的星星 */
            $('.comment-star').raty({
                starOn:'${pageContext.request.contextPath }/images/star-on.png',
                starOff:'${pageContext.request.contextPath }/images/star-off.png',
                halfShow: false,
                score:3,
                readOnly: false
            });

            /* 自定义校验 */
            /* 租车时间限制：不低于4个小时 */
            jQuery.validator.addMethod("returnTimeLimit", function (value, element) {
                var getDate = new Date($('.get-date-choice').val());
                var returnDate = new Date(value);
                var totalHours = (returnDate - getDate) / 1000 / 3600;
                if (totalHours < 4) {  // 租车时间至少为4个小时
                    $('.return-date-choice').val("");
                    return false;
                } else {
                    return true;
                }
            }, "租时应>=4小时");

            /* 校验表单 */
            $('#date-choice-form').validate({
                rules: {
                    returntime: "returnTimeLimit"
                }
            });
        });

        // 打开百度地图
        function openMap(address) {
            var longitude = null; // 经度
            var latitude = null;  // 纬度
            // 弹出地图框
            layer.open({
                title: '地址选择',
                type: 1,
                closeBtn: 1,  // 调试用
                area: ['650px', '550px'], //宽高
                content: '<div id="r-result"><input id="suggestId"  class="form-control searchInput" type="text" placeholder="地址搜索框" /></div> ' +
                '<button class="btn btn-primary confirmBtn">搜索门店</button>' +
                '<div class="searchTip">请选择地址并搜索门店，只显示十个最近的门店</div>' +
                '<div class="storeNameBox">' +
                '<a href="javascript:void(0)" onclick="selectStore(this);" class="storeName">天河区门店</a>' +
                '</div>' +
                '<div id="searchResultPanel"></div>' +
                '<div id="allmap"></div>'
            });
            // 初始化地图：中心位置北京天安门
            var map = new BMap.Map("allmap");  // 创建一个地图对象
            var point = new BMap.Point(116.404, 39.915);  // 根据经纬度设置中心点:天安门
            map.centerAndZoom(point,12);  // 设置中心点和缩放级别，数字越大，显示的范围越小
            map.enableScrollWheelZoom();  // 支持滚轮缩放
            map.addControl(new BMap.NavigationControl());  // 左上角添加平移缩放控件
            map.addControl(new BMap.ScaleControl());  // 左下方显示比例
            // 自动补全搜索
            var ac = new BMap.Autocomplete({    //建立一个自动完成的对象
                "input" : "suggestId",
                "location" : map
            });

            ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
                var str = "";
                var _value = e.fromitem.value;
                var value = "";
                if (e.fromitem.index > -1) {
                    value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
                }
                str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

                value = "";
                if (e.toitem.index > -1) {
                    _value = e.toitem.value;
                    value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
                }
                str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
                $("#searchResultPanel").html(str);
            });

            var myValue;
            ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
                var _value = e.item.value;
                myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
                $("#searchResultPanel").html("onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue);
                map.clearOverlays();    //清除地图上所有覆盖物
                function myFun(){
                    var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                    map.centerAndZoom(pp, 18);
                    map.addOverlay(new BMap.Marker(pp));    //添加标注
                }
                var local = new BMap.LocalSearch(map, { //智能搜索
                    onSearchComplete: myFun
                });
                local.search(myValue);
            });

            // 如果地址为空
            if (address == "") {
                // 根据ip获取地址：初步定位到城市
                function myFun(result){
                    var cityName = result.name;
                    map.setCenter(cityName);
                }

                var myCity = new BMap.LocalCity();
                myCity.get(myFun);
            }

            // 根据地址在地图上显示
            var myGeo = new BMap.Geocoder();
            myGeo.getPoint(address, function(point) {
                if (point) {
                    map.centerAndZoom(point, 17);
                    map.addOverlay(new BMap.Marker(point));    // 标注
                    longitude = point.lng;
                    latitude = point.lat;
                }
            });

            // 鼠标点击获取地址并添加标记
            map.addEventListener("click", function(e) {
                map.clearOverlays();  // 清空所有覆盖物
                newMarker = new BMap.Marker(e.point);
                map.addOverlay(newMarker);
                var pt = e.point;
                myGeo.getLocation(pt, function(rs) {
                    var addComp = rs.addressComponents;
                    longitude = pt.lng;
                    latitude = pt.lat;
                    // alert(addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber);
                });
            });

            // 更新经纬度
            $(".confirmBtn").click(function() {
                alert(longitude + "," + latitude);
                // @Todo 根据经纬度搜索最近的10家商店并异步加载出来
                // layer.closeAll();  // 关闭所有窗口
            });
        }
        
        // 选择门店
        function selectStore(storeNameLink) {
            // alert($(storeNameLink).text());
            $(".storename").val($(storeNameLink).text());
            layer.closeAll();  // 关闭所有窗口
        }

    </script>

    <!-- 评论弹框 -->
    <div class="comment-box" style="display: none;">
        <div class="commentAll">
            所有评论
            <div class="comment-show">
                <div class="comment-show-con clearfix">
                    <div class="comment-show-con-img pull-left">
                        <img src="images/header-img-comment_03.png" alt="头像" onerror="this.src='${pageContext.request.contextPath }/images/user/head-if-non.png'">
                    </div>
                    <div class="comment-show-con-list pull-left clearfix">
                        <div class="pl-text clearfix">
                            <a href="#" class="comment-size-name">张三 : </a>
                            <span class="my-pl-con">&nbsp;来啊 造作啊</span>
                        </div>
                        <div class="date-dz">
                            <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                            <div class="date-dz-right pull-right comment-pl-block">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- 评论分页 start -->
        <div class="clearfloat"><div class="m-style comment-pagenator right-float"></div></div>
        <div class="clearfloat">
            <p class="comment-tips right-float">
                总记录
                <span class="count">100</span>条，每页显示
                <span class="count">10</span>条，总页数为
                <span class="count">10</span>页
            </p>
        </div>
        <!-- 评论分页 end -->
    </div>

    <script>
        /* 显示评分的星星 */
        $('.comment-pl-block').raty({
            starOn:'${pageContext.request.contextPath }/images/star-on.png',
            starOff:'${pageContext.request.contextPath }/images/star-off.png',
            hints: ['差', '一般', '好', '非常好', '全五星'],
            halfShow: false,
            score: 3,
            readOnly: true,
            click: function (score, evt) {
            }
        });

        /* 显示分页 */
        $('.comment-pagenator').pagination({
            totalData: 100, // 总记录数
            showData: 10,    // 每页显示记录数
            mode: 'fixed',  // 固定显示多少页数
            callback: function (api) {  // 回调函数
                console.log(api.getCurrent());  // 当前页数
                // @todo ajax分页
            }
        });

        /* 显示评论 */
        function showComment(target) {
            var title = target == "car" ? "汽车评论列表" : "门店评论列表";

            layer.open({
                title: title,
                type: 1,
                closeBtn: 1,  // 调试用
                area: ['650px', '550px'], //宽高
                content: $('.comment-box'),
                cancel: function(index, layero) {
                    $(".comment-box").css("display", "none");  // 隐藏评论表单
                }
            });
        }
    </script>
</body>
</html>
