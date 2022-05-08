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
                            <label class="layui-form-label">Reservation Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="reservationName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Id Card</label>
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
                            <label class="layui-form-label">Type</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId"  autocomplete="off" class="layui-input s_roomTypeId">
                                    <option value="">All</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Status</label>
                            <div class="layui-input-inline">
                                <select name="status" autocomplete="off" class="layui-input">
                                    <option value="">All</option>
                                    <option value="1">Pending</option>
                                    <option value="2">Confirmed</option>
                                    <option value="3">Occupied</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Start Date</label>
                            <div class="layui-input-inline">
                                <input type="text" name="arriveDate" id="startTime" autocomplete="off" class="layui-input" placeholder="" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">End Date</label>
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="batchConfirm"><i
                        class="layui-icon layui-icon-edit"></i>Batch
                </button>
            </div>
        </script>


        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>


        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                    class="layui-icon layui-icon-ok-circle"></i>Confirm</a>
        </script>


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
            url: '${pageContext.request.contextPath}/admin/orders/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 50, title: 'id', align: "center"},
                {field: 'roomType', width: 120, title: 'Room Type', align: "center",templet:function (d) {
                        return d.roomType.typeName;
                    }},
                {field: 'roomNum', width: 100, title: 'room num', align: "center",templet:function (d) {
                        return d.room.roomNum;
                    }},
                {field: 'reservationName', width: 100, title: 'Customer', align: "center"},
                {field: 'status', width: 100, title: 'Status', align: "center",templet:function (d) {
                        if(d.status==1){
                            return "Pending";
                        }else if(d.status==2){
                            return "Confirmed";
                        }else if(d.status==3){
                            return "Checked";
                        }else{
                            return "Completed";
                        }
                    }},
                {field: 'phone', width: 120, title: 'phone', align: "center"},
                {field: 'reservePrice', width: 80, title: 'Price', align: "center"},
                {field: 'reserveDate', minWidth: 160, title: 'Reserve', align: "center"},
                {field: 'arriveDate', width: 110, title: 'Arrive', align: "center"},
                {field: 'leaveDate', width: 110, title: 'Leave', align: "center"},
                {title: 'operations', width: 120, toolbar: '#currentTableBar', align: "center",fixed:"right"}
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
                case "batchConfirm":
                    batchConfirm();
                    break;
            }
        });

        table.on("tool(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "edit":
                    confirmOrders(obj.data);
                    break;
            }
        });


        function confirmOrders(data) {
            if(data.status==1){
                $.post("/admin/orders/confirmOrders",{"id":data.id},function(result){
                    if(result.success){
                        tableIns.reload();
                    }
                    layer.msg(result.message);
                },"json");
            }else{
                layer.msg("This order has been confirmed before.");
            }
        }


        function batchConfirm() {
            var checkStatus = table.checkStatus('currentTableId');
            var length = checkStatus.data.length;

            if(length>0){
                for (var i = 0; i < length; i++) {
                    if(checkStatus.data[i].status!=1){
                        layer.alert("Can not confirmed",{icon:0});
                        return;
                    }
                }

                layer.confirm("Are you sure",function (index) {

                    var data = checkStatus.data;

                    var idArr = [];

                    for (var i = 0; i < length; i++) {

                        idArr.push(data[i].id);
                    }

                    var ids = idArr.join(",");

                    $.post("/admin/orders/batchConfirm",{"ids":ids},function(result){
                        if(result.success){

                            tableIns.reload();
                        }
                        layer.msg(result.message);
                    },"json");
                });


            }else{
                layer.msg("Select a order");
            }
        }


    });
</script>

</body>
</html>
