<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li data-id="index" class="layui-nav-item layui-hide-xs layui-this">
                <a class="fly-case-active" data-type="toTopNav" href="/home.jsp">Main</a>
            </li>
            <li data-id="room" class="layui-nav-item layui-hide-xs">
                <a class="fly-case-active" data-type="toTopNav" href="/room/list.html">Room</a>
            </li>
            <c:choose>
                <c:when test="${not empty sessionScope.currentUser.loginName}">
                    <li data-id="login" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" >${sessionScope.currentUser.loginName}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li data-id="login" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" href="/login.jsp">Login</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${not empty sessionScope.currentUser.loginName}">
                    <li data-id="register" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" href="/account/logout">Login out</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li data-id="register" class="layui-nav-item layui-hide-xs ">
                        <a class="fly-case-active" data-type="toTopNav" href="/register.jsp">Register</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <span class="layui-nav-bar" style="left: 560px; top: 55px; width: 0px; opacity: 0;"></span>
        </ul>
    </div>
</div>

<div class="shop-nav shop-index">

    <div id="LAY-topbar" style="height: auto;">
        <form class="layui-form layuimini-form">
            <div class="input-search">
                <div id="searchRoom">
                    <input type="text" placeholder="Search Room" name="keywords" id="searchKeywords"
                           autocomplete="off" value="">
                    <button class="layui-btn layui-btn-shop" lay-submit="" lay-filter="searchHotelRoom" style="background-color: #009688">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                </div>
                <div class="layui-container layui-hide-xs"><a href="#" class="topbar-logo">
                    <img src="${pageContext.request.contextPath}/statics/front/images/logo-1.png" alt="layui"> </a></div>
            </div>
        </form>
    </div>

    <div class="shop-banner">

        <div class="layui-container layui-hide-xs">
            <div class="product-list">
                <dl id="getIndexRoomType">
                    <dt style="background-color: #009688"><a href="lists.html" target="_blank">Room Types</a></dt>
                    <c:forEach var="roomType" items="${roomTypeList}">
                        <dd data-id="${roomType.id}">
                            <a class="fly-case-active" href="/room/list/${roomType.id}" data-type="toRoomTypeList">${roomType.typeName}</a>
                        </dd>
                    </c:forEach>
                </dl>
            </div>
        </div>

        <div class="layui-carousel" lay-filter="LAY-store-banner" id="LAY-store-banner" lay-anim lay-indicator="inside" >
            <div carousel-item>
                <div class="layui-this">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/11.jpg" alt="Hotel"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/12.jpg" alt="Hotel"></a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/13.jpg" alt="Hotel"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/14.jpg" alt="Hotel"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/15.jpg" alt="Hotel"> </a>
                    </div>
                </div>
                <div class="">
                    <div class="layui-container"><a href="javascript:;" target="_blank">
                        <img src="${pageContext.request.contextPath}/statics/front/images/4.jpg" alt="Hotel"> </a>
                    </div>
                </div>
            </div>


            <div class="layui-carousel-ind">
                <ul>
                    <li class="layui-this"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li>
                </ul>
            </div>
            <button class="layui-icon layui-carousel-arrow" lay-type="sub">???</button>
            <button class="layui-icon layui-carousel-arrow" lay-type="add">???</button>
        </div>

        <div class="shop-temp" id="getIndexFloor">
            <div class="temp-hot">
            <div class="layui-container">
                <p class="temp-title-cn"><span></span>Room List<span></span></p>
                <div class="layui-row layui-col-space20">
                    <c:forEach var="room" items="${roomList}">
                        <div data-id="${room.id}" class="layui-col-xs6 layui-col-md3">
                            <a class="template store-list-box fly-case-active" href="/room/${room.id}.html" data-type="toRoomInfo">
                                <img src="/hotel/show/${room.photo}" class="store-list-cover">
                                <h2 class="layui-elip">${room.typeName} </h2>
                                <p class="price"> <span title="Price"> $${room.price} </span> <span title="Number" style="color:  #fff;background: #1aa094;padding: 3px;text-align: center;font-size: 13px;"> NO.${room.roomNum} </span></p>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div>



    <div class="fly-footer">
        <p>Hotel Management System</p>

    </div>



    <script src="${pageContext.request.contextPath}/statics/front/layui/dist/layui.js"></script>
    <script>
        layui.use(["form","element","carousel"], function () {
            var form = layui.form,
                layer = layui.layer,
                element = layui.element,
                carousel = layui.carousel,
                $ = layui.$;

            carousel.render({
                elem: '#LAY-store-banner'
                ,width: '100%' //??????????????????
                ,height: '460' //??????????????????
                ,arrow: 'always' //??????????????????
            });
        });
    </script>

    <ul class="layui-fixbar">
        <li class="layui-icon layui-fixbar-top" lay-type="top" style="">???</li>
    </ul>
    <div class="layui-layer-move"></div>
</div>
</body>
</html>
