<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/9/22 0022
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"/>

</head>
<body>
<div class="container">

    <div class="row" style="margin-top: 20px">
        <div class="col-md-4">
            <div style="border-left: green solid 5px;padding: 10px;background-color: rgb(230,230,230)">某地区蒸发量和降水量</div>
            <div id="left_box"
                 style="width: 100%;height: 450px;padding: 10px;border-left: rgb(230,230,230) solid 5px;border-right: rgb(240,240,240) solid 1px;border-bottom: rgb(240,240,240) solid 1px;">

            </div>
        </div>
        <div class="col-md-4">
            <div style="border-left: green solid 5px;padding: 10px;background-color: rgb(230,230,230)">未来一周气温变化</div>
            <div id="center_box"
                 style="width: 100%;height: 450px;padding: 10px;border-left: rgb(230,230,230) solid 5px;border-right: rgb(240,240,240) solid 1px;border-bottom: rgb(240,240,240) solid 1px;">

            </div>
        </div>
        <div class="col-md-4">
            <div style="border-left: green solid 5px;padding: 10px;background-color: rgb(230,230,230)">某站点用户访问来源</div>
            <div id="right_box"
                 style="width: 100%;height: 450px;padding: 10px;border-left: rgb(230,230,230) solid 5px;border-right: rgb(240,240,240) solid 1px;border-bottom: rgb(240,240,240) solid 1px;">

            </div>
        </div>
    </div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var left_box = echarts.init(document.getElementById('left_box'));
        var center_box = echarts.init(document.getElementById('center_box'));
        var right_box = echarts.init(document.getElementById('right_box'));


        $(window).ready(function () {
            // 指定图表的配置项和数据
            var option1 = {

                tooltip: {},
                legend: {
                    right: "right",
                    data: ['销售量', '进货量']
                },
                xAxis: {
                    data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
                },
                yAxis: {},
                series: [
                    {
                        name: '销售量',
                        type: 'bar',
                        data: [21, 12, 36, 63, 98, 120, 159, 168, 135, 106, 63, 42]
                    },
                    {
                        name: '进货量',
                        type: 'bar',
                        data: [16, 15, 40, 66, 88, 130, 161, 159, 130, 100, 66, 40]
                    },
                ]
            };
            var option2 = {

                tooltip: {},
                legend: {
                    right: "right",
                    data: ['最高气温', '最低气温']
                },
                xAxis: {
                    data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
                },
                yAxis: {},
                series: [
                    {
                        name: '最高气温',
                        type: 'line',
                        data: [35, 34, 36, 38, 37, 36, 38]
                    },
                    {
                        name: '最低气温',
                        type: 'line',
                        data: [19, 20, 22, 18, 24, 23, 21]
                    }
                ]
            };
            var option3 = {

                legend: {
                    orient: "vertical",
                    left: "left",
                    data: [],

                },
                tooltip: {
                    trigger: "item",
                    formatter: "{a} <br/> {b} : {c} ({d}%)",//显示百分比
                },

                series: [{
                    name: '销量',
                    type: 'pie',
                    radius: "60%",//大小
                    center: ["50%", "65%"],//位置
                    data: []
                }]
            };
            var name1 = [];
            var num11 = [];
            var num21 = [];
            var name2 = [];
            var num12 = [];
            var num22 = [];
            var data3 = [];
            var data4 = [];
            $.get("goods/query.action", function (data) {
                for (var i = 0; i < data.length; i++) {
                    data3.push([data[i].name, data[i].num1]);
                    data4.push(data[i].name);
                }
                option3.series[0].setData(data3);
                option3.legend[0].setData(data4);
            });
            // 使用刚指定的配置项和数据显示图表。
            left_box.setOption(option1);
            center_box.setOption(option2);
            right_box.setOption(option3);
        });

    </script>
</div>
</body>
</html>
