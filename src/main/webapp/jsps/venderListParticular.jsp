<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>千佛山医院管理系统 库存</title>
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script src="/bootstrap/table/bootstrap-table.js"></script>
    <script src="/bootstrap/js/bootstrap-tab.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/cxCalendar/js/jquery.cxcalendar.js"></script>
    <script src="/cxCalendar/js/jquery.cxcalendar.languages.js"></script>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap-tab.css">
    <link rel="stylesheet" href="/cxCalendar/css/jquery.cxcalendar.css">
    <style>
        span {
            float: left;
        }

        #temp1 input {
            width: 150px;
        }

        #temp1 table tr {
            height: 50px;
        }

        #temp3 input {
            width: 100px;
        }

        img {
            height: 240px;
            float: left;
            box-shadow: 0 0 5px black;
        }
    </style>
    <script>
        function updata() {
            $("input").removeAttr("disabled");
            $("#temp4").css("display", "none");
            $("#temp5").css("display", "block");
        }

        function updata1() {
            $.ajax({
                url: "/Vender/UpdataVender",
                data: new FormData($("#temp6")[0]),
                type: "post",
                processData: false,
                contentType: false,
                success: function (data) {

                }
            })
            $("#temp1 table input").attr("disabled", "disabled");
            $("#temp4").css("display", "block");
            $("#temp5").css("display", "none");
        }
    </script>
</head>

<body>
<c:import url="utlis/background.jsp"/>
<c:import url="utlis/broadside.jsp"/>
<div style="width: 1300px; height: 800px; border:1px solid rgba(0,0,0,0.6); float: left; margin: 50px 0px 0px 60px; box-shadow: 0 0 8px black;">
    <h3 style="margin-bottom: 40px">代理厂商详情</h3>
    <div style="margin: 40px; margin-top: 94px; box-shadow: 0 0 4px black; height: 620px; padding: 25px 50px 0 50px; text-align: left;" id="temp1">
        <form id="temp6">
            <table style="float:left;">
                <input type="hidden" value="${AGENCY.id}" name="id">
                <tr>
                    <td><span>代理商名称：</span></td>
                    <td><input type="text" value="${AGENCY.name}" class="form-control" disabled name="name"></td>
                </tr>
                <tr>
                    <td><span>营业执照时间：</span></td>
                    <td><input type="text" value="${AGENCY.date}" class="form-control" disabled name="date"></td>
                </tr>
                <c:forEach items="${AGENCY.productLines}" var="i">
                    <tr>
                        <td><span>产品线名称：</span></td>
                        <td><input type="text" value="${i.name}" disabled class="form-control" name="name1"></td>
                    </tr>
                    <tr>
                        <td><span>地区：</span></td>
                        <td><input type="text" value="${i.address}" disabled class="form-control" name="address"></td>
                    </tr>
                    <tr>
                        <td><span>代理有效期：</span></td>
                        <td><input type="text" value="${i.validityOfAgency}" disabled class="form-control" name="validityOfAgency"></td>
                    </tr>
                    <input type="hidden" value="${i.id}" name="id1">
                </c:forEach>
            </table>
        </form>
        <div id="Temp2" style="margin-left: 400px; margin-top: 9px">
            <img src="/img/credentials/${AGENCY.credentials}">
            <img src="/img/credentials/${AGENCY.credentials1}" style="margin-left: 3em; margin-bottom: 40px"><br>
            <img src="/img/businessLicense/${AGENCY.businessLicense}">
        </div>
        <div style="float: right; margin-top: 250px;" id="temp3">
            <input type="button" value="修改" class="btn-primary btn" onclick="updata()" id="temp4">
            <input type="button" value="添加" class="btn-primary btn" onclick="updata1()" style="margin-left: 1em; display: none;" id="temp5">
        </div>
    </div>
</div>
</body>
</html>