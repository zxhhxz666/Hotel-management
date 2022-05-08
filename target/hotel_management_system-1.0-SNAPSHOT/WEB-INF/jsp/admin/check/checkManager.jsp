<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/css/layui.css"
          media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>Search Info</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="customerName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">ID</label>
                            <div class="layui-input-inline">
                                <input type="text" name="idCard" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Phone</label>
                            <div class="layui-input-inline">
                                <input type="text" name="phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Room Type</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId" autocomplete="off" class="layui-input s_roomTypeId">
                                    <option value="">All</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Status</label>
                            <div class="layui-input-inline">
                                <select name="status" autocomplete="off" class="layui-input">
                                    <option value="">All</option>
                                    <option value="1">Check In</option>
                                    <option value="2">Check Out</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Arrive Date</label>
                            <div class="layui-input-inline">
                                <input type="text" name="arriveDate" id="startTime" autocomplete="off" class="layui-input" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Leave Date</label>
                            <div class="layui-input-inline">
                                <input type="text" name="leaveDate" id="endTime" autocomplete="off" class="layui-input" placeholder="" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center">
                            <button type="submit" class="layui-btn"  lay-submit lay-filter="data-search-btn"><i class="layui-icon layui-icon-search"></i>Search</button>
                            <button type="reset" class="layui-btn layui-btn-warm"><i class="layui-icon layui-icon-refresh-1"></i>Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="checkIn"><i
                        class="layui-icon layui-icon-edit"></i>Record
                </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="checkout"><i
                    class="layui-icon layui-icon-delete"></i>Check out</a>
        </script>

        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Order Id</label>
                        <div class="layui-input-inline">
                            <input type="text" name="ordersId" lay-verify="required" autocomplete="off" readonly
                                   placeholder="" class="layui-input">
                        </div>
                        <div class="layui-form-mid" style="position:relative;bottom:5px;">
                            <button type="button" class="layui-btn layui-btn-sm" id="openOrdersWindow"><i class="layui-icon layui-icon-add-circle-fine"></i>Select Orders</button>
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Room Type</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomtypeid">
                            <input type="text" name="roomTypeName" placeholder="" lay-verify="required" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">Room Num</label>
                        <div class="layui-input-inline">
                            <input type="hidden" name="roomid">
                            <input type="text" name="roomNum" placeholder="" lay-verify="required" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Name</label>
                        <div class="layui-input-inline">
                            <input type="text" name="customerName" placeholder="" lay-verify="required" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">Phone</label>
                        <div class="layui-input-inline">
                            <input type="text" name="phone" placeholder=""  lay-verify="required" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Price</label>
                        <div class="layui-input-inline">
                            <input type="text" name="payPrice" placeholder="" lay-verify="required" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">Status</label>
                        <div class="layui-input-inline">
                            <input type="text" value="Checked In" autocomplete="off" readonly class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Arrive Date</label>
                        <div class="layui-input-inline">
                            <input type="text" name="arriveDate" placeholder="" readonly autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">Leave Date</label>
                        <div class="layui-input-inline">
                            <input type="text" name="leaveDate" placeholder="" readonly autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="idCard" placeholder="" lay-verify="required" autocomplete="off" readonly class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Remark</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark"></textarea>
                    </div>
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
        <div style="display: none;" id="selectOrdersWindow">
            <table class="layui-hide" id="ordersTableId" lay-filter="ordersTableFilter"></table>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>


    layui.use(['form', 'table', 'laydate', 'jquery', 'layer'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            layer = layui.layer,
            table = layui.table;

        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });

        $.get("/admin/roomType/findAll",function(result){
            var html = "";

            for (var i = 0; i <result.length; i++) {
                html +="<option value='"+result[i].id+"'>"+result[i].typeName+"</option>"
            }

            $("[name='roomTypeId']").append(html);

            form.render("select");
        },"json");


        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/checkin/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 100, title: 'Id', align: "center"},
                {field: 'roomType', width: 100, title: 'Type', align: "center",templet:function (d) {
                        return d.roomType.typename;
                    }},
                {field: 'room', width: 80, title: 'Room Num', align: "center",templet:function (d) {
                        return d.room.roomnum;
                    }},
                {field: 'customerName', width: 100, title: 'Name', align: "center"},
                {field: 'idCard', minWidth: 120, title: 'Id Card', align: "center"},
                {field: 'phone', width: 150, title: 'Phone', align: "center"},
                {field: 'status', width: 100, title: 'Status', align: "center",templet:function (d) {
                        return d.status==1 ? "<font color='red'>Checked in</font>" : "Checked out";
                    }},
                {field: 'payPrice', width: 120, title: 'Price', align: "center"},
                {field: 'arriveDate', width: 170, title: 'Arrive', align: "center"},
                {field: 'leaveDate', width: 170, title: 'Leave', align: "center"},
                {title: 'operations', width: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            page: true,
            done: function (res, curr, count) {

                if (curr > 1 && res.data.length == 0) {
                    var pageValue = curr - 1;

                    tableIns.reload({
                        page: {curr: pageValue}
                    });
                }
            }
        });



        form.on('submit(data-search-btn)', function (data) {
            tableIns.reload({
                where: data.field,
                page: {
                    curr: 1
                }
            });
            return false;
        });

        table.on("toolbar(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "checkIn":
                    openCheckInWindow();
                    break;
            }
        });


        table.on("tool(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "checkout":
                    checkOut(obj.data);
                    break;
            }
        });


        var url;
        var mainIndex;


        function openCheckInWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "Record",
                area: ["800px", "570px"],
                content: $("#addOrUpdateWindow"),
                success: function () {
                    $("#dataFrm")[0].reset();
                }
            });
        }

        $("#openOrdersWindow").click(function () {
            var index = layer.open({
                type: 1,
                title: "Select an Order",
                area: ["1300px", "500px"],
                maxmin: true,
                content: $("#selectOrdersWindow"),
                success: function () {
                    $("#dataFrm")[0].reset();
                    url = "/admin/checkin/addCheckin";
                    initOrdersTable();
                },
                btn:["<i class='layui-icon layui-icon-ok'></i>Sure","<i class='layui-icon layui-icon-close'></i>Cancel"],
                yes:function (index, layero) {
                    var checkStatus = table.checkStatus('ordersTableId');
                    if(checkStatus.data.length>0){
                        var data = checkStatus.data[0];
                        form.val("dataFrm",{
                            "ordersId":data.id
                            ,"roomTypeId": data.roomTypeId
                            ,"roomTypeName": data.roomType.typeName
                            ,"roomNum": data.room.roomNum
                            ,"roomId": data.roomId
                            ,"customerName": data.reservationName
                            ,"phone": data.phone
                            ,"payPrice": data.reservePrice
                            ,"arriveDate": data.arriveDate
                            ,"leaveDate": data.leaveDate
                            ,"idCard": data.idCard
                            ,"remark":data.remark
                        });
                        layer.close(index);
                    }else{
                        layer.msg("Select an order！")
                    }
                },
                cancel:function () {

                }
            });
            layer.full(index);
        });


        function initOrdersTable() {
            table.render({
                elem: '#ordersTableId',
                url: '${pageContext.request.contextPath}/admin/orders/list?status=2',//Only require the confirmed orders
                cols: [[
                    {type: "radio", width: 50},
                    {field: 'id', width: 80, title: 'id', align: "center"},
                    {field: 'roomType', width: 120, title: 'Type', align: "center",templet:function (d) {
                            return d.roomType.typeName;
                        }},
                    {field: 'room', width: 80, title: 'Room Num', align: "center",templet:function (d) {
                            return d.room.roomNum;
                        }},
                    {field: 'reservationName', width: 100, title: 'Name', align: "center"},
                    {field: 'idCard', width: 200, title: 'Id Card', align: "center"},
                    {field: 'phone', width: 150, title: 'Phone', align: "center"},
                    {field: 'status', width: 150, title: 'Status', align: "center",templet:function (d) {
                            if(d.status==1){
                                return "Pending";
                            }else if(d.status==2){
                                return "Confirmed";
                            }else if(d.status==3){
                                return "CheckedIn";
                            }
                        }},
                    {field: 'reservePrice', width: 80, title: 'Price', align: "center"},
                    {field: 'reserveDate', width: 160, title: 'Reserve', align: "center"},
                    {field: 'arriveDate', width: 110, title: 'Arrive', align: "center"},
                    {field: 'leaveDate', width: 110, title: 'Leave', align: "center"},
                ]],
                page: true
            });
        }


        form.on("submit(doSubmit)",function (data) {
            $.post(url,data.field,function(result){
                if(result.success){

                    tableIns.reload();

                    layer.close(mainIndex);
                }

                layer.msg(result.message);
            },"json");

            return false;
        });


        function checkOut(data) {

            if(data.status==1){
              layer.confirm("Check out?",{icon:3,title:"Confirm"},function (index) {
                 $.post("/admin/checkout/addCheckout",{"checkInId":data.id},function(result){
                     if(result.success){
                         layer.alert(result.message,{icon:6});
                         tableIns.reload();
                     }else{
                         layer.alert(result.message,{icon:5});
                     }
                 },"json");
                layer.close(index);
              });
            }else{
                layer.msg("This order has been checked out.");
            }
        }

    });
</script>

</body>
</html>
