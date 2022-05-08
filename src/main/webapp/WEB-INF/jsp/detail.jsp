<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="fly-html-layui fly-html-store">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/layui/dist/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/global.css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/global(1).css" charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/front/css/store.css" charset="utf-8">
    <link rel="icon" href="${pageContext.request.contextPath}/statics/front/images/favicon.ico">
    <title>Main Page</title>
<body>

<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="index.html">
            <img src="${pageContext.request.contextPath}/statics/front/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs"><a class="fly-case-active" data-type="toTopNav"
                                                                        href="/index.html">Main</a></li>
            <li data-id="room" class="layui-nav-item layui-hide-xs layui-this"><a class="fly-case-active"
                                                                                  data-type="toTopNav"
                                                                                  href="/room/list.html">Room</a></li>

                    <li data-id="login" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" href="/login.jsp">Login</a>
                    </li>

                    <li data-id="register" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" href="/register.jsp">Register</a>
                    </li>

            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span></ul>
    </div>
</div>

<div class="shop-nav shop-index">

    <div id="LAY-topbar" style="height: auto;">
        <form class="layui-form layuimini-form">
            <div class="input-search">
                <div id="searchRoom"><input type="text" placeholder="Search Room" name="keywords" id="searchKeywords"
                                            autocomplete="off" value="">
                    <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchHotelRoom" style="background-color: #009688"><i
                            class="layui-icon layui-icon-search"></i></button>
                </div>
                <div class="layui-container layui-hide-xs"><a href="#" class="topbar-logo"> <img
                        src="${pageContext.request.contextPath}/statics/front/images/logo-1.png" alt="layui"> </a></div>
            </div>
        </form>
    </div>
</div>

<div class="layui-container shopdata">
    <div class="layui-card shopdata-intro">
        <div class="layui-card-header">
				<span class="layui-breadcrumb layui-hide-xs" style="visibility: visible;">
				<a href="/index.html">Main Page</a><span lay-separator="">/</span>
						           <a href="/room/list.html" id="floorNumber">Room List</a><span lay-separator="">/</span>

						 <a><cite>Details</cite></a> </span>

        </div>
        <div class="layui-card-body layui-row">
            <div class="layui-col-md6">
                <div class="intro-img photos"> <img id="coverImg" src="/hotel/show/${room.photo}" alt="" layer-index="0"> </div>
            </div>
            <div class="layui-col-md6">
                <div class="intro-txt">
                    <h1 class="title" id="roomName">${room.typeName}</h1>
                    <input type="hidden" id="id" name="id" value="1">
                    <div class="store-attrs">
                        <div class="summary">
                            <p class="reference"><span>Number:</span> <span id="roomNumber">NO.${room.roomNum}</span></p>
                            <p class="reference"><span>Bed Number:</span> <span id="bedType">${room.bedNum}</span></p>
                            <p class="reference"><span>Network:</span> <span id="broadband">Free Wifi</span></p>
                            <p class="reference"><span>Standard Price:</span> $<span id="standardPrice">${room.price}</span></p>
                            <p class="activity"><span>Status:</span>
                                <strong class="status">

                                    <span>${room.statusStr}</span>

                                </strong>

                            </p>
                        </div>
                    </div>

                    <p class="store-detail-active" id="shopEvent">

                        <input type="hidden" id="currentUserId" value="${sessionScope.currentUser.id}">

                        <input type="hidden" id="price" value="${room.price}">
                        <c:if test="${room.status==3}">
                            <a href="javascript:;" id="bookRoomBtn" data-type="memberReserveHotel" class="store-bg-green fly-memberReserveHotel">
                                <i class="layui-icon layui-icon-dollar"></i>Order</a>
                        </c:if>
                        <c:if test="${room.status!=3}">
                            <a href="javascript:;" id="bookRoomBtn2" data-type="memberReserveHotel" class="store-bg-orange fly-memberReserveHotel">
                                <i class="layui-icon layui-icon-dollar"></i>Order</a>
                        </c:if>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-card shopdata-content">
        <div class="layui-card-body detail-body layui-text">
            <div id="roomContent">
                ${room.roomDesc}
            </div>
        </div>
    </div>
</div>
<div style="display: none;padding: 5px" id="orderRoomWindow">
    <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">

        <input type="hidden" name="accountId" value="${sessionScope.currentUser.id}">
        <input type="hidden" name="roomId" value="${room.id}">
        <input type="hidden" name="roomTypeId" value="${room.roomTypeId}">
        <div class="layui-form-item">
            <label class="layui-form-label">Reserved Date</label>
            <div class="layui-input-block">
                <input type="text" id="book_date" lay-verify="required" autocomplete="off" readonly placeholder="Reserved Range"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">Check In Date</label>
                <div class="layui-input-inline">
                    <input type="text" name="arriveDate" id="arrivedate" lay-verify="required"  readonly placeholder="Check In Range"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">Leave Time</label>
                <div class="layui-input-inline">
                    <input type="text" name="leaveDate" id="leavedate" lay-verify="required" readonly  placeholder="Leave Date Range"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">Days</label>
                <div class="layui-input-inline">
                    <input type="text" name="day" id="day" lay-verify="required" readonly  placeholder="Days Used"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">Price</label>
                <div class="layui-input-inline">
                    <input type="text" name="reservePrice" id="reservePrice" lay-verify="required"  readonly placeholder="Price Compute"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">Name</label>
                <div class="layui-input-inline">
                    <input type="text" name="reservationName" lay-verify="required"  placeholder="Please input your name"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">Phone</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required"  placeholder="Input phone"
                           class="layui-input">
                </div>
            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-block">
                <input type="text" name="idCard" lay-verify="required" autocomplete="off" placeholder="Input ID"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Comment</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea" name="remark" id="content"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 80px">
            <span style="color: red;font-size: 16px;">Attention: Please take your ID card</span>
        </div>
        <div class="layui-form-item layui-row layui-col-xs12">
            <div class="layui-input-block" style="text-align: center;">
                <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit"><span
                        class="layui-icon layui-icon-add-1"></span>Submit
                </button>
                <button type="reset" class="layui-btn layui-btn-warm"><span
                        class="layui-icon layui-icon-refresh-1"></span>Reset
                </button>
            </div>
        </div>
    </form>
</div>

<div class="fly-footer">
    <p>Hotel Management System</p>
</div>

<script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
<script>
    layui.use(["form","element","carousel","layer","laydate"], function () {
        var form = layui.form,
            layer = layui.layer,
            element = layui.element,
            carousel = layui.carousel,
            laydate = layui.laydate,
            $ = layui.$;

        carousel.render({
            elem: '#LAY-store-banner'
            ,width: '100%'
            ,height: '460'
            ,arrow: 'always'
        });

        function getDays(strDateStart,strDateEnd){
            var strSeparator = "-";
            Date1= strDateStart.split(strSeparator);
            oDate2= strDateEnd.split(strSeparator);
            var strDateS = new Date(Date1[0], Date1[1]-1, Date1[2]);
            var strDateE = new Date(oDate2[0], oDate2[1]-1, oDate2[2]);
            iDays = parseInt(Math.abs(strDateS - strDateE ) / 1000 / 60 / 60 /24)
            return iDays ;
        }

        laydate.render({
            elem:"#book_date",
            min:"new Date()",
            range:"to",
            done:function (value,date,endDate) {
                var startDate = value.substr(0,value.indexOf(" ")).trim();
                var endDate = value.substr(value.lastIndexOf(" "),value.length).trim();
                $("#arrivedate").val(startDate);
                $("#leavedate").val(endDate);
                var day = getDays(startDate,endDate);
                $("#day").val(day);
                var price  = day * $("#price").val();
                $("#reservePrice").val(price);
            }
        });


        var mainIndex;

        $("#bookRoomBtn").click(function () {
            var userId = $("#currentUserId").val();

            if(userId=="" || userId.length==0){
                alert("Please login first!")
                location.href="/login.jsp";
            } else {
                mainIndex = layer.open({
                    type: 1,
                    title: "Room Order",
                    area: ["800px", "550px"],
                    content: $("#orderRoomWindow"),
                    success: function () {
                        $("#dataFrm")[0].reset();
                    }
                });
            }
        });


        $("#bookRoomBtn2").click(function () {
            layer.alert("This room has been ordered",{icon:5,
                closeBtn: 0,
                btn: ['Close']
            });
        });

        form.on("submit(doSubmit)",function (data) {

            console.log(data.field)

            $.post("/orders/addOrders",data.field,function(result){
                if(result.success){
                    layer.alert(result.message,{icon:6});
                    layer.close(mainIndex);
                    window.location.reload();
                }else{
                    layer.alert(result.message,{icon:5});
                }
            },"json");

            return false;
        });



    });
</script>

<ul class="layui-fixbar">
    <li class="layui-icon layui-fixbar-top" lay-type="top" style=""></li>
</ul>
<div class="layui-layer-move"></div>

</body>
</html>
