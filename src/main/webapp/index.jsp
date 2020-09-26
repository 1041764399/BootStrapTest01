<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/21 0021
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <script type="text/javascript" src="js/bootstrap-table.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>
    <link rel="stylesheet" href="css/bootstrap-table.css">
</head>
<body>
<div class="container">
    <!--    数据展示-->
    <div class="panel panel-default">
        <div class="panel-heading">
            用户查询
        </div>
        <div class="panel-body">
            <!--工具栏-->
            <div id="toolbar">
                <button id="editUserBtn" class="btn btn-primary">修改用户</button>
                <button id="delUserBtn" class="btn btn-danger">删除用户</button>
            </div>

            <table id="table"></table>
        </div>
    </div>
    <!--    修改界面-->
    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <%--头部--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">用户信息修改</h4>
                </div>-
                <form class="form-horizontal">
                    <%--身体--%>
                    <div class="modal-body" style="padding: 10px">
                        <!--编号-->
                        <div class="form-group">
                            <label class="control-label col-md-2" for="edit_uid">编号：</label>
                            <div class="col-md-10">
                                <input class="form-control" id="edit_uid" name="uid" readonly="readonly">
                            </div>
                        </div>
                        <!--用户名-->
                        <div class="form-group">
                            <label class="control-label col-md-2" for="edit_user">用户名：</label>
                            <div class="col-md-10">
                                <input class="form-control" id="edit_user" name="user" placeholder="请输入用户名">
                            </div>
                        </div>
                        <!--密码-->
                        <div class="form-group">
                            <label class="control-label col-md-2" for="edit_pass">密码：</label>
                            <div class="col-md-10">
                                <input class="form-control" id="edit_pass" name="pass" placeholder="请输入密码">
                            </div>
                        </div>
                    </div>
                    <%--脚部--%>
                    <div class="modal-footer">
                        <!--提交按钮-->
                        <button type="button" id="userUpdate_btn" class="btn btn-primary">提交</button>

                        <button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $('#table').bootstrapTable({
        contentType: "application/x-www-form-urlencoded",
        url: 'user/query.action',
        method: 'post',                     //请求方式（*）
        toolbar: '#toolbar',                //工具按钮用哪个容器
        striped: true,                      //是否显示行间隔色
        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true,                   //是否显示分页（*）
        sortable: true,                     //是否启用排序
        sortOrder: "asc",                   //排序方式
        sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 10,                       //每页的记录行数（*）
        pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
        search: true,                       //是否显示表格搜索
        strictSearch: true,
        showColumns: true,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        minimumCountColumns: 2,             //最少允许的列数
        clickToSelect: true,                //是否启用点击选中行
        height: 666,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
        uniqueId: "uid",                    //每一行的唯一标识，一般为主键列
        showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
        cardView: false,                    //是否显示详细视图
        detailView: false,                  //是否显示父子表

        //得到查询的参数
        queryParams: function (params) {
            //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            var temp = {
                rows: params.limit,                         //页面大小
                page: (params.offset / params.limit) + 1   //页码
            };
            return temp;
        },
        columns: [
            {
                checkbox: true,
                visible: true                  //是否显示复选框
            },
            {
                field: 'uid',
                title: '编号',
                align: 'center',
                width: 200,
            },
            {
                field: 'user',
                title: '用户名',
                align: 'center',
                width: 300,
            },
            {
                field: 'pass',
                title: '密码',
                align: 'center',
                width: 300,
            },
            {
                field: 'caoZuo',
                title: '操作',
                align: 'center',
                width: 200,
                formatter: function (value, row, index) {
                    return "<button type='button' onclick='upt(" + row.uid + ")' class='btn btn-primary glyphicon glyphicon-pencil'></button>" +
                        "&nbsp;" +
                        "<button type='button' onclick='del(" + row.uid + ")' class='btn btn-danger glyphicon glyphicon-trash'></button>";
                },
            },
        ],
        onClickRow: function (row) {
            var uid = row.uid;
        },
    });

    function del(uid) {
        var bool = confirm("您确定要删除这条记录吗?");
        if (bool == true) {
            $.post("user/delete.action", {"uid": uid}, function (data) {
                if (data == true) {
                    alert("删除成功！");
                } else {
                    alert("删除失败！");
                }
                $("#table").bootstrapTable("refresh");
            });

        }
    }

    function upt(uid) {
        $("#editModal").modal("show");
        //为修改界面传递数据
        $.post("user/queryById.action", {"uid": uid}, function (data) {
            $("#edit_uid").val(data.uid);
            $("#edit_user").val(data.user);
            $("#edit_pass").val(data.pass);
        });
    }

    //点击删除按钮
    $("#delUserBtn").click(function () {
        var selrows = $("#table").bootstrapTable("getAllSelections");
        if (selrows.length == 0) {
            alert("请至少选中一行后删除");
            return;
        }

        var bool = confirm("您确定要删除这些记录吗?");
        if (bool == true) {
            for (var i = 0; i < selrows.length; i++) {
                $.post("user/delete.action", {"uid": selrows[i].uid}, function (data) {
                    if (data == true) {
                        alert("删除成功！");
                    } else {
                        alert("删除失败！");
                    }
                    $("#table").bootstrapTable("refresh");
                });
            }
        }
    });
    //点击修改按钮
    $("#editUserBtn").click(function () {
        var selrows = $("#table").bootstrapTable("getAllSelections");

        if (selrows.length != 1) {
            alert("请选择一条数据！");
            return;
        }
        $("#editModal").modal("show");
        //为修改界面传递数据
        $("#edit_uid").val(selrows[0].uid);
        $("#edit_user").val(selrows[0].user);
        $("#edit_pass").val(selrows[0].pass);

    });
    //点击修改按钮
    $("#userUpdate_btn").click(function () {
        //提交表单 修改用户
        $.post("user/update.action",
            {uid: $("#edit_uid").val(), user: $("#edit_user").val(), pass: $("#edit_pass").val()}, function (data) {
                if (data == true) {
                    alert("修改成功")
                    $("#editModal").modal("hide");
                } else {
                    alert("修改失败")
                }
                $('#table').bootstrapTable("refresh");
            });
    });
</script>
</body>
</html>
