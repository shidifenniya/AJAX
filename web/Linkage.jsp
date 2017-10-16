<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午5:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地区联动</title>
    <script src="jquery-3.2.1.js"></script>
</head>
<body id="region">

<form>

    地区:

    <select name="province" id="provinceId">
        <option value="0">请选择</option>
    </select>

    城市:
    <select name="city" id="city">
        <option value="0">请选择</option>
    </select>

</form>

<script>

    window.onload = function () {

        $.post({
            url: "/LinkServlet", dataType: "json", success: function (date) {

                var _html = "";

                for (var i = 0; i < date.length; i++) {

                    _html += '<option value=' + date[i].province + '>' + date[i].province + '</option>';

                }

                $("#provinceId").append(_html);

            }
        })

    };

    $("#provinceId").blur(function () {

        $.post({
            url: "/LinkServlet", dataType: "json", success: function (date) {

                var _html = "";

                var province = $("#provinceId").val();

//                alert(province);

                for (var i = 0; i < date.length; i++) {

                    if (province == date[i].province) {

                        var citeList = date[i].city;

                        for(var j = 0 ; j< citeList.length;j++){

                            _html += '<option value=' + citeList[j] +'>' + citeList[j] + '</option>';

                        }

                    }

                }

                $("#city").empty();

                $("#city").append('<option value=' + 0 +'>' + '请选择' + '</option>');

                $("#city").append(_html);

            }
        })

    })

</script>

</body>
</html>
