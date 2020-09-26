<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>

    <style type="text/css">
        body {
            background-color: rgb(240, 240, 240);
        }

        #box {
            width: 550px;
            height: 350px;
            margin: auto;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            background-color: white;
        }
    </style>
</head>
<body>

<div id="box">
    <form>
        <div class="bg-primary"
             style="height: 80px;line-height: 80px;color: white;font-size: 30px;text-align: center">
            注&nbsp;册
        </div>

        <div id="user_box" class="form-group" style="margin-top: 35px;height: 50px">
            <label class="control-label col-md-2 col-lg-2 col-sm-2 col-xs-2 col-md-offset-1 col-lg-offset-1 col-sm-offset-1 col-xs-offset-1"
                   for="user" style="line-height: 50px;text-align: right">
                用户名：
            </label>
            <div class="col-md-8 col-lg-8 col-sm-8 col-xs-8">
                <input id="user" name="user" type="text" placeholder="请输入用户名" class="form-control pull-left"
                       style="height: 50px"/>
                <span id="user_span" class=""
                      style="line-height: 50px;margin-right: 20px" aria-hidden="true"></span>
            </div>
        </div>

        <div id="pass_box" class="form-group" style="margin-top: 20px;height: 50px">
            <label class="control-label col-md-2 col-lg-2 col-sm-2 col-xs-2 col-md-offset-1 col-lg-offset-1 col-sm-offset-1 col-xs-offset-1"
                   for="pass" style="line-height: 50px;text-align: right">
                密码：
            </label>
            <div class="col-md-8 col-lg-8 col-sm-8 col-xs-8">
                <input id="pass" name="pass" type="password" placeholder="请输入密码" class="form-control pull-left"
                       style="height: 50px"/>
                <span id="pass_span" class=""
                      style="line-height: 50px;margin-right: 20px" aria-hidden="true"></span>
            </div>
        </div>

        <div class="row" style="margin-top: 35px">
            <button type="button" id="register_btn"
                    class="btn btn-success col-md-8 col-lg-8 col-sm-8 col-xs-8 col-md-offset-2 col-lg-offset-2 col-sm-offset-2 col-xs-offset-2"
                    style="height: 40px;">注&nbsp;册
            </button>
        </div>

    </form>
</div>
<script type="text/javascript">
    $(window).ready(function () {
        $("#user").blur(function () {
            if ($("#user").val() == "" || $("#user").val() == null) {
                document.getElementById("user_box").className = "form-group has-error has-feedback";
                document.getElementById("user_span").className = "glyphicon glyphicon-remove form-control-feedback";

            } else {
                $.post("user/login.action",{
                        user:$("#user").val(),
                    },
                    function (data) {
                        if (data==true){
                            document.getElementById("user_box").className = "form-group has-error has-feedback";
                            document.getElementById("user_span").className = "glyphicon glyphicon-remove form-control-feedback";
                            alert("用户已存在");
                        }else {
                            document.getElementById("user_box").className = "form-group has-success has-feedback";
                            document.getElementById("user_span").className = "glyphicon glyphicon-ok form-control-feedback";
                        }
                    }
                )
            }
        });
        $("#pass").blur(function () {
            if ($("#pass").val() == "" || $("#pass").val() == null) {
                document.getElementById("pass_box").className = "form-group has-error has-feedback";
                document.getElementById("pass_span").className = "glyphicon glyphicon-remove form-control-feedback";

            } else {
                document.getElementById("pass_box").className = "form-group has-success has-feedback";
                document.getElementById("pass_span").className = "glyphicon glyphicon-ok form-control-feedback";
            }
        });
        $("#register_btn").click(function () {
            if ($("#user").val() == "" || $("#user").val() == null) {
                document.getElementById("user_box").className = "form-group has-error has-feedback";
                document.getElementById("user_span").className = "glyphicon glyphicon-remove form-control-feedback";

            } else if ($("#pass").val() == "" || $("#pass").val() == null) {
                document.getElementById("pass_box").className = "form-group has-error has-feedback";
                document.getElementById("pass_span").className = "glyphicon glyphicon-remove form-control-feedback";

            }else {
                $.post("user/login.action",{
                        user:$("#user").val(),
                    },
                    function (data) {
                        if (data==true){
                            document.getElementById("user_box").className = "form-group has-error has-feedback";
                            document.getElementById("user_span").className = "glyphicon glyphicon-remove form-control-feedback";

                        }else {
                            document.getElementById("user_box").className = "form-group has-success has-feedback";
                            document.getElementById("user_span").className = "glyphicon glyphicon-ok form-control-feedback";
                            document.getElementById("pass_box").className = "form-group has-success has-feedback";
                            document.getElementById("pass_span").className = "glyphicon glyphicon-ok form-control-feedback";

                            $.post("user/register.action", {
                                user: $("#user").val(),
                                pass: $("#pass").val(),
                            }, function (data) {
                                if (data==true){
                                    alert("注册成功");
                                    window.location="login.jsp";
                                }
                            });
                        }
                    }
                )
            }
        });
    });

</script>
</body>
</html>
