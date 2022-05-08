<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/css/layui.css"   media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/layuimini.css?v=2.0.4.2" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/themes/default.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/public.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/layui_ext/dtree/font/dtreefont.css">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row">
            <div class="layui-col-md3">
                <ul id="menuTree" class="dtree" data-id="0" style="width: 240px;"></ul>
            </div>

            <div class="layui-col-md9">
                <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

                <script type="text/html" id="currentTableBar">
                    <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>Edit</a>
                    <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-close"></i>Delete</a>
                </script>


                <div style="display: none;padding: 5px" id="addOrUpdateWindow">
                    <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">

                        <input type="hidden" name="id">
                        <div class="layui-form-item">
                            <label class="layui-form-label">Upper Menu</label>
                            <div class="layui-input-block">
                                <input type="hidden" name="pid" id="pid">
                                <ul id="menuSelectTree" class="dtree" data-id="0"></ul>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">Menu Name</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="required" autocomplete="off" placeholder="please input menu name" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">href</label>
                            <div class="layui-input-block">
                                <input type="text" name="href"  autocomplete="off" placeholder="Please input href" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">icon</label>
                            <div class="layui-input-block">
                                <input type="text" name="icon" id="iconPicker" lay-filter="iconPicker" autocomplete="off" placeholder="Please input icon" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">Spread or not</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="spread" value="1" title="Yes">
                                    <input type="radio" name="spread" value="0" title="No" checked>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item layui-row layui-col-xs12">
                            <div class="layui-input-block" style="text-align: center;">
                                <button type="button" class="layui-btn" lay-submit lay-filter="doSubmit"><span class="layui-icon layui-icon-add-1"></span>Submit</button>
                                <button type="reset" class="layui-btn layui-btn-warm"><span class="layui-icon layui-icon-refresh-1"></span>Clear</button>
                                <button type="button" class="layui-btn layui-btn-danger" id="resetMenu"><span class="layui-icon layui-icon-return"></span>Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        dtree:"${pageContext.request.contextPath}/statics/layui_ext/dtree/dtree",
        iconPickerFa :'${pageContext.request.contextPath}/statics/js/lay-module/iconPicker/iconPickerFa'
    }).use(['form', 'table', 'layer','jquery', 'dtree', 'iconPickerFa'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer,
            iconPickerFa = layui.iconPickerFa,
            dtree = layui.dtree;
        dtree.render({
            elem: "#menuTree",
            url: "/admin/menu/loadMenuTree",
            dataStyle: "layuiStyle",
            dataFormat: "list",
            response:{message:"msg",statusCode:0},
        });
        var tableIns = table.render({
            elem: '#currentTableId',
            url: '${pageContext.request.contextPath}/admin/menu/list',
            toolbar: '#toolbarDemo',
            cols: [[
                {field: 'id', width: 100, title: 'id', sort: true, align: "center"},
                {field: 'title', width: 200, title: 'menu name', align: "center"},
                {field: 'href', minWidth:200, title: 'address', align: "center"},
                {field: 'spread', width: 80, title: 'spread', align: "center", templet: function(d){
                        return d.spread == 1 ? "Yes" : "No";
                    } },
                {field: 'icon', width: 150, title: 'icon', align: "center", templet: function(d){
                        return "<i class='" + d.icon + "'/i>";
                    }}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 8,
            page: true,
            skin: 'line',
            done: function (res, curr, count) {
                if (curr > 1 && res.data.length == 0) {
                    var pageValue = curr - 1;

                    tableIns.reload({
                        page: {curr: pageValue}
                    });
                }
            }
        });
        dtree.on("node(menuTree)",function(obj) {
            tableIns.reload({
                where:{
                    "id":obj.param.nodeId
                },
                page:{curr: 1}
            });
        });
    });
</script>



</html>
