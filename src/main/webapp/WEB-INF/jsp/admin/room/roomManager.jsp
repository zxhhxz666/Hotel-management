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
    <style>
        .thumbBox{ height:200px; overflow:hidden; border:1px solid #e6e6e6; border-radius:2px; cursor:pointer; position:relative; text-align:center; line-height:200px;width: 210px;}
        .thumbImg{ max-width:100%; max-height:100%; border:none;}
        .thumbBox:after{ position:absolute; width:100%; height:100%;line-height:200px; z-index:-1; text-align:center; font-size:20px; content:""; left:0; top:0; color:#9F9F9F;}
    </style>
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
                            <label class="layui-form-label">Room Id</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roomNum" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Room Type</label>
                            <div class="layui-input-inline">
                                <select name="roomTypeId" id="s_roomTypeId" autocomplete="off" class="layui-input">
                                    <option value="">all</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Status</label>
                            <div class="layui-input-inline">
                                <select name="status" id="s_status" autocomplete="off" class="layui-input">
                                    <option value="">All</option>
                                    <option value="1">Reserved</option>
                                    <option value="2">Occupied</option>
                                    <option value="3">Available</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center">
                            <button type="submit" class="layui-btn" lay-submit lay-filter="data-search-btn"><i
                                    class="layui-icon layui-icon-search"></i>Search
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><i
                                    class="layui-icon layui-icon-refresh-1"></i>Reset
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>


        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i
                        class="layui-icon layui-icon-add-1"></i>Add
                </button>
            </div>
        </script>


        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>


        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i
                    class="layui-icon layui-icon-edit"></i>Edit</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i
                    class="layui-icon layui-icon-close"></i>Delete</a>
        </script>


        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">

                <input type="hidden" name="id">
                <div class="layui-col-md12 layui-col-xs12">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md9 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">Room Id</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="roomNum" lay-verify="required"  placeholder="Input Room Number">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">Room Type</label>
                                <div class="layui-input-block">
                                    <select name="roomTypeId" id="roomtypeid" lay-verify="required">
                                        <option value="">Select Room Type</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">Remark</label>
                                <div class="layui-input-block">
                                    <textarea class="layui-textarea" name="remark" id="remark"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3 layui-col-xs5">
                            <div class="layui-upload-list thumbBox mag0 magt3">
                                <input type="hidden" name="photo" id="photo" value="defaultimg.jpg">
                                <img class="layui-upload-img thumbImg" src="/hotel/show/defaultimg.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item magb0">
                        <div class="layui-inline">
                            <label class="layui-form-label">Status</label>
                            <div class="layui-input-inline">
                                <select name="status" id="status" lay-verify="required">
                                    <option value="">Select Room Status</option>
                                    <option value="1">Reserved</option>
                                    <option value="2">Occupied</option>
                                    <option value="3">Available</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">Room Desc</label>
                        <div class="layui-input-block" >
                            <textarea id="roomdesc" name="roomDesc" style="display: none;"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="text-align: center;">
                            <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit" id="doSubmit"><span
                                    class="layui-icon layui-icon-add-1"></span>Submit
                            </button>
                            <button type="reset" class="layui-btn layui-btn-warm"><span
                                    class="layui-icon layui-icon-refresh-1"></span>Reset
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer','upload','layedit'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload,
            layedit = layui.layedit,
            layer = layui.layer,
            table = layui.table;

        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/room/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 60, title: 'Id', align: "center"},
                {field: 'roomNum', minWidth: 120, title: 'Number', align: "center"},
                {field: 'typeName', minWidth: 100, title: 'Type', align: "center"},
                {field: 'statusStr', minWidth: 100, title: 'Status', align: "center"},
                {title: 'operations', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
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

        $.get("/admin/roomType/findAll",function(result){
            var html = "";
            for (var i = 0; i < result.length; i++) {
                html += "<option value='" + result[i].id + "'>" + result[i].typeName + "</option>"
            }

            $("[name='roomTypeId']").append(html);

            form.render("select");
        },"json");


        upload.render({
            elem:".thumbImg",
            url: '/admin/file/uploadFile',
            acceptMime: 'image/*',
            field: 'file',
            method: "post",
            done: function (res, index, upload) {
                $(".thumbImg").attr("src",res.data.src);
                $('.thumbBox').css("background", "#fff");
                $("#photo").val(res.data.imgPath);
            }
        });

        table.on("toolbar(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "add":
                    openAddWindow();
                    break;
            }
        });

        table.on("tool(currentTableFilter)",function (obj) {
            console.log(obj);
            switch (obj.event) {
                case "edit":
                    openUpdateWindow(obj.data);
                    break;
                case "delete":
                    deleteById(obj.data);
                    break;
            }
        });

        var url;
        var mainIndex;
        var detailIndex;

        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "Add Room",
                area: ["800px", "500px"],
                content: $("#addOrUpdateWindow"),
                maxmin: true,
                success: function () {

                    $("#dataFrm")[0].reset();

                    url = "/admin/room/addRoom";

                    $(".thumbImg").attr("src","/hotel/show/defaultimg.jpg");

                    $("#photo").val("defaultimg.jpg");
                }
            });

            layer.full(mainIndex);

            detailIndex = layedit.build("roomdesc",{
                uploadImage:{
                    url:"/admin/file/uploadFile",
                    type:"post"
                }
            });
        }
        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "Edit Room",
                area: ["800px", "500px"],
                content: $("#addOrUpdateWindow"),
                maxmin: true,
                success: function () {

                    form.val("dataFrm",data);

                    url = "/admin/room/updateRoom";

                    $(".thumbImg").attr("src","/hotel/show/"+data.photo);
                    $('.thumbBox').css("background", "#fff");
                    $("#photo").val(data.photo);
                }
            });

            layer.full(mainIndex);

            detailIndex = layedit.build("roomdesc",{
                uploadImage:{
                    url:"/admin/file/uploadFile",
                    type:"post"
                }
            });
        }
        form.on("submit(doSubmit)",function (data) {

            layedit.sync(detailIndex);

            $.post(url,$("#dataFrm").serialize(),function(result){
                if(result.success){

                    tableIns.reload();

                    layer.close(mainIndex);
                }

                layer.msg(result.message);
            },"json");

            return false;
        });

        function deleteById(data) {

            if(data.status==3){
                layer.confirm("Delete this room?", {icon: 3, title:'Confirm'}, function(index){
                    $.post("/admin/room/deleteById",{"id":data.id},function(result){
                        if(result.success){
                            tableIns.reload();
                        }
                        layer.msg(result.message);
                    },"json");

                    layer.close(index);
                });
            }else{
                layer.msg("You can not delete occupied or reserved room！");
            }
        }

    });
</script>

</body>
</html>
