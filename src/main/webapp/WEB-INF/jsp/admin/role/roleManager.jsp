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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui_ext/dtree/font/dtreefont.css">

</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>Search</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">Role Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleName" autocomplete="off" class="layui-input">
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>Add</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>Edit</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-close"></i>Delete</a>
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="grantMenu"><i class="layui-icon layui-icon-edit"></i>Assgin Menus</a>
        </script>

        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
                <div class="layui-form-item">
                    <label class="layui-form-label">Name</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="id">
                        <input type="text" name="roleName" lay-verify="required" autocomplete="off"
                               placeholder="Please input role name" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Description</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="roleDesc" id="roleDesc"></textarea>
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
        <div style="display: none;" id="selectRoleMenuDiv">
            <ul id="roleTree" class="dtree" data-id="0"></ul>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>


    layui.extend({
        dtree:"${pageContext.request.contextPath}/statics/layui_ext/dtree/dtree",
    }).use(['form', 'table', 'laydate', 'jquery','layer','dtree'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            dtree = layui.dtree,
            layer = layui.layer,
            table = layui.table;


        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/role/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 100, title: 'id', align: "center"},
                {field: 'roleName', minWidth: 150, title: 'role name', align: "center"},
                {field: 'roleDesc', minWidth: 200, title: 'role description', align: "center"},
                {title: 'operation', minWidth: 120, toolbar: '#currentTableBar', align: "center"}
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
                case "add":
                    openAddWindow();
                    break;
            }
        });


        table.on("tool(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "edit":
                    openUpdateWindow(obj.data);
                    break;
                case "delete":
                    deleteById(obj.data);
                    break;
                case "grantMenu"://分配菜单按钮
                    openGrantMenuWindow(obj.data);
                    break;
            }
        });

        var url;
        var mainIndex;

        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "Add Role",
                area: ["800px", "400px"],
                content: $("#addOrUpdateWindow"),
                success: function () {
                    $("#dataFrm")[0].reset();

                    url = "/admin/role/addRole";
                }
            });
        }

        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "Edit Role",
                area: ["800px", "400px"],
                content: $("#addOrUpdateWindow"),
                success: function () {
                    form.val("dataFrm",data);
                    url = "/admin/role/updateRole";
                }
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

        function deleteById(data) {
            $.get("/admin/role/checkRoleHasUsers",{"roleId":data.id},function(result){
                if(result.exist){
                    layer.msg(result.message);
                }else{
                    layer.confirm("Delete right now ?", {icon: 3, title:'Confirm'}, function(index){

                        $.post("/admin/role/deleteById",{"roleId":data.id},function(result){
                            if(result.success){
                                tableIns.reload();
                            }
                            layer.msg(result.message);
                        },"json");

                        layer.close(index);
                    });
                }
            },"json");
        }

        function openGrantMenuWindow(data) {
            mainIndex = layer.open({
                type: 1,
                area:["400px","400px"],
                title:"Assign Menus",
                content: $("#selectRoleMenuDiv"),
                btn: ['Submit', 'Cancel']
                ,yes: function(index, layero){
                    var params = dtree.getCheckbarNodesParam("roleTree");
                    if(params.length>0){
                        var idArr = [];

                        for (var i = 0; i < params.length; i++) {
                            idArr.push(params[i].nodeId);//nodeId是选中的树节点的值，固定不能修改
                        }

                        var ids = idArr.join(",");

                        $.post("/admin/role/saveRoleMenu",{"ids":ids,"roleId":data.id},function(result){
                            layer.msg(result.message);
                        },"json");
                        layer.close(mainIndex);
                    }else{
                        layer.msg("Please select the menu !");
                    }

                }
                ,btn2: function(index, layero){

                },
                success: function () {

                    dtree.render({
                        elem: "#roleTree",
                        url: "/admin/role/initMenu?roleId="+data.id,
                        dataStyle: "layuiStyle",
                        dataFormat: "list",
                        response:{message:"msg",statusCode:0},
                        checkbar: true,
                        checkbarType: "all"
                    });
                }
            });
        }

    });
</script>

</body>
</html>

