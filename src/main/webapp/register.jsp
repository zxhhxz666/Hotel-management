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
    <title>Hotel Management System</title>
<body>

<div class="layui-header header header-store" style="background-color: #393D49;">
    <div class="layui-container">
        <a class="logo" href="index.html">
            <img src="${pageContext.request.contextPath}/statics/front/images/logo.png" alt="layui">
        </a>
        <div class="layui-form component" lay-filter="LAY-site-header-component"></div>
        <ul class="layui-nav" id="layui-nav-userinfo">
            <li data-id="index" class="layui-nav-item layui-hide-xs "><a class="fly-case-active" data-type="toTopNav"
                                                                                   href="/index.html">Main</a></li>
            <li data-id="room" class="layui-nav-item layui-hide-xs"><a class="fly-case-active"
                                                                       data-type="toTopNav"
                                                                       href="/room/list.html">Room</a></li>

            <li data-id="login" class="layui-nav-item layui-hide-xs ">
                 <a class="fly-case-active" data-type="toTopNav" href="/login.jsp">Login</a>
             </li>

             <li data-id="register" class="layui-nav-item layui-hide-xs ">
                 <a class="fly-case-active" data-type="toTopNav" href="/account/logout">Login out</a>
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

        <div class=" login-content">

            <div class="login-bg">
                <div class="login-cont w1200">
                    <div class="form-box" style="height: 550px">
                        <form class="layui-form" action="">
                            <legend style="height: 0px">Register</legend>
                            <div class="layui-form-item">
                                    <div class="layui-input-inline" style="line-height: 2.2">
                                        <label class="layui-input-inline">Login Name: <font size="1" color="red">Digits + alphabets<= 10.</font></label>
                                        <input type="text" name="loginName" id="mNickname" lay-verify="required" lay-reqText="Please input login name" placeholder="" autocomplete="off" class="layui-input">
                                    </div>

                                    <div class="layui-input-inline" style="line-height: 2.2">
                                        <label class="layui-input-inline">Password: <font size="1" color="red">Digits + capital and lower letter <= 20.</font></label>
                                        <input id="pnum" type="password" name="password" lay-verify="required"  lay-reqText="Please input password"  placeholder="" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline"  style="line-height: 2.2; text-align: right">
                                        <label class="layui-input-inline" style="font-size: 5px">Strength: <span id="strength" style="color:red">unknown</span></label>
                                    </div>
                                    <div class="layui-input-inline" style="line-height: 2.2">
                                        <label class="layui-input-inline">Password Again: <font size="1" color="red">Same with the password above.</font></label>
                                        <input id="pnum2" type="password" name="password2" lay-verify="required"  lay-reqText="Please input password"  placeholder="" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline" style="line-height: 2.2">
                                        <label class="layui-input-inline">Email: <font size="1" color="red"> abcdefg12345@gmail.com.</font></label>
                                        <input id="email" type="text" name="email" lay-verify="required"  lay-reqText="Please input email"  placeholder="" autocomplete="off" class="layui-input">
                                    </div>
                                    <div class="layui-input-inline" style="line-height: 2.2">
                                        Email Code:<input type="hidden" id = "emailco" name="emailco" value = ${emailcode}>
                                        <input type="text" name="emailcode" id="j_emailcode" style="width: 215px">
                                        <input id="getCode" type="button" style="background-color: #009688;width: 100px; height: 20px; text-align: center; color: white" name="getCode" lay-verify="required"  lay-reqText=""  placeholder="" autocomplete="off" class="layui-input" value="Get Code">
                                    </div>
                                </div>
                            <div class="layui-form-item login-btn" >
                                <div class="layui-input-block">
                                    <button class="layui-btn" style="background-color: #009688" lay-submit="" lay-filter="register">Submit</button>
                                </div>
                            </div>
                        </form>
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
            ,width: '100%'
            ,height: '460'
            ,arrow: 'always'
        });

        var pnumFlag = false;
        var messagePnum;

        $("#pnum").blur(function () {
            var password = $("#pnum").val().trim();
            $("#strength").html("unknown");
            if(password.length > 0){
                $.get("/account/checkPassword",{"password":password},function(result){
                    if(result.exist){
                        messagePnum = result.message;
                        $("#strength").html(messagePnum);
                        pnumFlag = true;
                    }else{
                        $("#strength").html(result.message);
                        pnumFlag = false;
                    }
                },"json");
            }
        });

        $("#getCode").click(function () {
            var email = $("#email").val().trim();
            var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if (email.length == 0) {
                layer.alert("Empty email!",{icon:5});
            } else if (!reg.test(email)) {
                layer.alert("Invalid email format!",{icon:5});
            }else {
                $.get("/account/sendEmail",{"email":email},function(result){
                    if(result.exist){
                        layer.alert(result.message,{icon:5});
                    }else{
                        layer.alert("The verification code has been sent.",{icon:6});
                        $("#emailco").val(result.message);
                    }
                },"json");
            }

        });

        $("#mNickname").blur(function () {
            var loginName = $("#mNickname").val().trim();
            if(loginName.length>0){
                $.get("/account/checkName",{"loginName":loginName},function(result){
                    if(result.exist){
                        //layer.alert(result.message,{icon:5});
                        messageGen = result.message
                        flag = true;
                    }else{
                        flag = false;
                    }
                },"json");
            }
        });


        form.on("submit(register)",function (data) {
            if(flag || pnumFlag){
                if (flag) {
                    layer.alert(messageGen,{icon:5})
                } else {
                    layer.alert("Password " + messagePnum,{icon:5})
                }
            } else{
                if (data.field.password != data.field.password2) {
                    layer.alert("Two password are different!", {icon: 5});
                } else {
                    var rightCode = $("#emailco").val();
                    var userCode = $("#j_emailcode").val();
                    if (rightCode != userCode) {
                        layer.alert("Verification code is wrong!",{icon:5});
                    } else {
                        $.post("/account/register", data.field, function (result) {
                            if (result.success) {

                                location.href="login.jsp";
                            } else {
                                layer.alert(result.message, {icon: 5});
                            }
                        }, "json");
                    }
                }
            }
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