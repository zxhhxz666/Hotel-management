<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/css/layui.css" media="all">
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
                            <label class="layui-form-label">Login Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="loginName" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">User Name</label>
                            <div class="layui-input-inline">
                                <input type="text" name="name" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Sex</label>
                            <div class="layui-input-inline">
                                <select name="sex" autocomplete="off" class="layui-input">
                                    <option value="">Please select sex</option>
                                    <option value="1">male</option>
                                    <option value="2">female</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Department</label>
                            <div class="layui-input-inline">
                                <select name="deptId" autocomplete="off" id="s_deptId" class="layui-input">
                                    <option value="">Please select department</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">Start Date</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startDate" id="startTime" autocomplete="off" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">End Date</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endDate" id="endTime" autocomplete="off" class="layui-input" readonly>
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
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i> Add </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>Edit</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-close"></i>Delete</a>
            <button class="layui-btn layui-btn-xs layui-btn-warm" lay-event="resetPwd"><i class="layui-icon layui-icon-refresh"></i>Reset</button>
            <button class="layui-btn layui-btn-xs" lay-event="grantRole"><i class="layui-icon layui-icon-edit"></i>Assign Roles </button>
        </script>

        <div style="display: none;padding: 5px" id="addOrUpdateWindow">
            <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
                <input type="hidden" name="id" id="id">

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Login Name</label>
                        <div class="layui-input-block">
                            <input type="text" name="loginName" id="loginName" lay-verify="required"  autocomplete="off" placeholder="Please input login name" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">User Name</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" id="name" lay-verify="required" autocomplete="off" placeholder="Please input user name" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Hire Date</label>
                        <div class="layui-input-block">
                            <input type="text" name="hireDate" id="hiredate" readonly lay-verify="required" autocomplete="off" placeholder="Please select hire date" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">Dept Name</label>
                        <div class="layui-input-block">
                            <select name="deptId" id="deptId" class="layui-input">
                                <option value="">Please select department</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">Sex</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="1" title="male" checked>
                            <input type="radio" name="sex" value="2" title="female" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Remark</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea" name="remark" id="remark"></textarea>
                    </div>
                </div>


                <div class="layui-form-item layui-row layui-col-xs12">
                    <div class="layui-input-block" style="text-align: center;">
                        <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit"><span class="layui-icon layui-icon-add-1"></span>Submit</button>
                        <button type="button" class="layui-btn layui-btn-warm" ><span class="layui-icon layui-icon-refresh-1"></span>Reset</button>
                    </div>
                </div>
            </form>
        </div>

        <div style="display: none;padding: 5px" id="selectUserRoleDiv">
            <table class="layui-hide" id="roleTable" lay-filter="roleTable"></table>
        </div>

    </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table','laydate','jquery'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            table = layui.table;

        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#hiredate'
        });

        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/user/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 50, title: 'id', align: "center"},
                {field: 'loginName', width: 120, title: 'login name', align: "center"},
                {field: 'name', width: 120, title: 'user name', align: "center"},
                {field: 'sex', width: 80, title: 'sex', align: "center", templet: function (d){
                        return d.sex == 1 ? "male" : "female";
                    }},
                {field: 'deptName', width: 120, title: 'department', align: "center"},
                {field: 'hireDate', width: 120, title: 'hire date', align: "center"},
                {title: 'operation', minWidth: 200, toolbar: '#currentTableBar', align: "center"}
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
        $.get("/admin/dept/deptList",function(result){
            var html = "";

            for (var i = 0; i < result.length; i++) {
                html +="<option value='"+result[i].id+"'>"+result[i].deptName+"</option>"
            }

            $("[name='deptId']").append(html);

            form.render("select");
        },"json");

        table.on("toolbar(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "add":
                    openAddWindow();
                    break;
            }
        });


        var url;
        var mainIndex;

        function openAddWindow() {
            mainIndex = layer.open({
                type: 1,
                title: "Add User",
                area: ["800px", "400px"],
                content: $("#addOrUpdateWindow"),
                success: function () {
                    $("#dataFrm")[0].reset();
                    url = "/admin/user/addUser";
                }
            });
        }
        table.on("tool(currentTableFilter)",function (obj) {
            switch (obj.event) {
                case "edit":
                    openUpdateWindow(obj.data);
                    break;
                case "delete":
                    deleteById(obj.data);
                    break;
                case "resetPwd":
                    resetPwd(obj.data);
                    break;
                case "grantRole":
                    grantRole(obj.data);
                    break;
            }
        });

        function openUpdateWindow(data) {
            mainIndex = layer.open({
                type: 1,
                title: "Edit User",
                area: ["800px", "400px"],
                content: $("#addOrUpdateWindow"),
                success: function () {
                    form.val("dataFrm",data);
                    url = "/admin/user/updateUser";
                }
            });
        }

        function deleteById(data) {
            layer.confirm("Delete right now ?", {icon: 3, title:'Confirm'}, function(index){

                $.post("/admin/user/deleteById",{"userId":data.id},function(result){
                    if(result.success){
                        tableIns.reload();
                    }
                    layer.msg(result.message);
                },"json");
                layer.close(index);
            });
        }

        function resetPwd(data) {
            layer.confirm("Delete right now ?", {icon: 3, title:'Confirm'}, function(index){

                $.post("/admin/user/resetPwd",{"userId":data.id},function(result){
                    if(result.success){
                        tableIns.reload();
                    }
                    layer.msg(result.message);
                },"json");
                layer.close(index);
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

        function grantRole(data) {
            mainIndex = layer.open({
                type: 1,
                title: "Assign Roles",
                area: ["800px", "500px"],
                content: $("#selectUserRoleDiv"),
                btn: ['Submit', 'Cancel'],
                yes: function(index, layero){
                    var checkStatus = table.checkStatus('roleTable');
                    if(checkStatus.data.length>0){
                        var idArr = [];
                        for (var i = 0; i < checkStatus.data.length; i++) {
                            idArr.push(checkStatus.data[i].id);
                        }
                        var ids = idArr.join(",");

                        $.post("/admin/user/saveUserRole",{"roleIds":ids,"userId":data.id},function(result){
                            layer.msg(result.message);
                        },"json");

                        layer.close(mainIndex);
                    }else{
                        layer.msg("Please select roles");
                    }
                }
                ,btn2: function(index, layero){
                },
                success: function () {
                    initTableData(data);
                }
            });
        }


        function initTableData(data) {
            table.render({
                elem: '#roleTable',
                url: '${pageContext.request.contextPath}/admin/role/initRoleListByUserId?id='+data.id,
                cols: [[
                    {type: "checkbox", width: 50},
                    {field: 'id', minWidth: 100, title: 'id', align: "center"},
                    {field: 'roleName', minWidth: 120, title: 'role name', align: "center"},
                    {field: 'roleDesc', minWidth: 120, title: 'role description', align: "center"}
                ]]
            });
        }
    });

</script>

</body>
</html>
