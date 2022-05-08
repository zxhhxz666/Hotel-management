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
      <legend>Search Information</legend>
      <div style="margin: 10px 10px 10px 10px">
        <form class="layui-form layui-form-pane" action="">
          <div class="layui-form-item">
            <div class="layui-inline">
              <label class="layui-form-label">Dept Name</label>
              <div class="layui-input-inline">
                <input type="text" name="deptName" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-inline">
              <button type="submit" class="layui-btn"  lay-submit lay-filter="data-search-btn">Search</button>
              <button type="reset" class="layui-btn layui-btn-danger" >Reset</button>
            </div>
          </div>
        </form>
      </div>
    </fieldset>

    <script type="text/html" id="toolbarDemo">
      <div class="layui-btn-container">
        <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"><i class="layui-icon layui-icon-edit"> Add </i></button>
      </div>
    </script>

    <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

    <script type="text/html" id="currentTableBar">
      <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit"><i class="layui-icon layui-icon-edit"> Edit </i></a>
      <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete"><i class="layui-icon layui-icon-delete"> Delete </i></a>
    </script>

    <div style="display: none;padding: 5px" id="addOrUpdateWindow">
      <form class="layui-form" style="width:90%;" id="dataFrm" lay-filter="dataFrm">
        <div class="layui-form-item">
          <label class="layui-form-label">Name</label>
          <div class="layui-input-block">
            <input type="hidden" name="id">
            <input type="text" name="deptName" lay-verify="required" autocomplete="off"
                   placeholder="Please input department name" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">Address</label>
          <div class="layui-input-block">
            <input type="text" name="address" lay-verify="required" autocomplete="off" placeholder="Please input department address"
                   class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">Remark</label>
          <div class="layui-input-block">
            <textarea class="layui-textarea" name="remark" id="content"></textarea>
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

  </div>
</div>
<script src="${pageContext.request.contextPath}/statics/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
  layui.use(['form', 'table', 'layer'], function () {
    var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer;

    var tableIns = table.render({
      elem: '#currentTableId',
      url: '${pageContext.request.contextPath}/admin/dept/list',
      toolbar: '#toolbarDemo',
      cols: [[
        {type: "checkbox", width: 50},
        {field: 'id', width: 150, title: 'id', sort: true, align: "center"},
        {field: 'deptName', width: 200, title: 'dept name', align: "center"},
        {field: 'address', width:150, title: 'address', align: "center"},
        {field: 'remark', width: 150, title: 'remark', align: "center"},
        {title: 'operation', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
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
          title: 'Add Department',
          type: 1,
          area: ['800px', '400px'],
          content: $("#addOrUpdateWindow"),
            success: function() {
              $("#dataFrm")[0].reset();
              url = "/admin/dept/addDept";
            }
        });
      }
    });


    table.on('tool(currentTableFilter)', function(obj) {
      if (obj.event == 'edit') {
        index = layer.open({
          title: 'Edit Department',
          type: 1,
          area: ['800px', '400px'],
          content: $("#addOrUpdateWindow"),
          success: function() {
           form.val("dataFrm", obj.data);
            url = "/admin/dept/updateDept";
          }
        });
      } else if (obj.event == 'delete') {
        deleteDeptById(obj.data);
      }
    });

    function deleteDeptById(data) {
      // We need to consider if there are some users in this department
      $.get("/admin/dept/checkDeptHasUsers", {'deptId': data.id}, function(result){
        if (result.exist) {
          // There are users in this department, we can not delete this department
          layer.msg(result.message);
        } else {
          layer.confirm('Delete right now?', {icon: 3, title:'Confirm'}, function(indexNew){
            $.post('/admin/dept/deleteById', {'deptId': data.id}, function(result) {
              if (result.success) {
                tableIns.reload();
              }
              layer.msg(result.message);
            }, 'json');
            layer.close(index);
          });
        }
      }, 'json');
    }

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