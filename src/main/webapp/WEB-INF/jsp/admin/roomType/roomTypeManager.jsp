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
        .thumbBox:after{ position:absolute; width:100%; height:100%;line-height:200px; z-index:-1; text-align:center; font-size:20px; content:"缩略图"; left:0; top:0; color:#9F9F9F;}
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
                            <label class="layui-form-label">Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="typeName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
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

        </script>


        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">

                <input type="hidden" name="id">
                <div class="layui-col-md12 layui-col-xs12">
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md9 layui-col-xs7">
                            <div class="layui-form-item magt3" style="margin-top: 8px;">
                                <label class="layui-form-label">Name</label>
                                <div class="layui-input-block">
                                    <input type="text" class="layui-input" name="typeName" lay-verify="required"  placeholder="Input room type">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">Status</label>
                                <div class="layui-input-block">
                                    <select name="status" id="status" lay-verify="required">
                                        <option value="">Select status</option>
                                        <option value="1">Available</option>
                                        <option value="2">Used</option>
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
                            <label class="layui-form-label">Price</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="price" lay-verify="required|number"
                                       placeholder="Input price">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Live People</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="liveNum" lay-verify="required|number"
                                       placeholder="Input people number">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Bed Num</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="bedNum" lay-verify="required|number" placeholder="Input bed number">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Total Num</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="roomNum" lay-verify="required|number"
                                       placeholder="Input total number">
                            </div>
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
    layui.use(['form', 'table', 'laydate', 'jquery', 'layer','upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            upload = layui.upload,
            layer = layui.layer,
            table = layui.table;


        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/roomType/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 60, title: 'id', align: "center"},
                {field: 'typeName', minWidth: 150, title: 'name', align: "center"},
                {field: 'price', minWidth: 100, title: 'price', align: "center"},
                {field: 'liveNum', minWidth: 100, title: 'live people', align: "center"},
                {field: 'bedNum', minWidth: 100, title: 'bed num', align: "center"},
                {field: 'roomNum', minWidth: 150, title: 'total number', align: "center"},
                {field: 'reservedNum', minWidth: 150, title: 'reserved number', align: "center"},
                {field: 'availableNum', minWidth: 150, title: 'available number', align: "center"},
                {field: 'livedNum', minWidth: 150, title: 'used number', align: "center"},
                {field: 'status', minWidth: 100, title: 'status', align: "center", templet: function(d){
                            return d.status == 1? "available" : "reserved";
                    }},
                {title: 'operation', minWidth: 100, toolbar: '#currentTableBar', align: "center"}
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

        var index;
        var url;

        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {
                index = layer.open({
                    title: 'Add Room Type',
                    type: 1,
                    area: ['800px', '440px'],
                    content: $("#addOrUpdateWindow"),
                    success: function() {
                        $("#dataFrm")[0].reset();
                        url = "/admin/roomType/addRoomType";
                        $(".thumbImg").attr("src","/hotel/show/defaultimg.jpg");
                        $("#photo").val("defaultimg.jpg");
                    }
                });
            }
        });
        table.on('tool(currentTableFilter)', function(obj) {
            if (obj.event == 'edit') {
                index = layer.open({
                    title: 'Edit Room Type',
                    type: 1,
                    area: ['800px', '440px'],
                    content: $("#addOrUpdateWindow"),
                    success: function() {
                        form.val("dataFrm", obj.data);
                        url = "/admin/roomType/updateRoomType";
                        $(".thumbImg").attr("src","/hotel/show/" + obj.data.photo);
                        $('.thumbBox').css("background", "#fff");
                        $("#photo").val(obj.data.photo);
                    }
                });
            } else if (obj.event == 'delete') {
                deleteRoomTypeById(obj.data);
            }
        });

        function deleteRoomTypeById(data) {

        }

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
        form.on('submit(doSubmit)', function(data) {
            $.post(url, data.field, function(result) {
                if (result.success) {
                    tableIns.reload();
                    layer.close(index);
                }
                layer.msg(result.message);
            }, 'json');
            return false;
        });
    });
</script>

</body>
</html>
