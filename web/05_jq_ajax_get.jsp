<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jq_jsp</title>
</head>

<script src="jquery-3.2.1.js"></script>
<body>
<button id="btn">点我</button>
</body>

<script>

    $(function () {

        $("#btn").click(function () {

//            $.get("/BServlet",function (data) {
//
//                alert(data.name);
//
//            },"json")

//            $.getJSON("/BServlet",function (data,status,xhr) {
//
//                alert(data.sex+","+status+","+xhr.status+","+xhr.statusText);
//
//            });

            $.ajax({url:"/BServlet",dataType:"json",type:"get",date:"name=a",success:function () {

                alert(typeof (data));

            },error:function (msg) {

                alert("错误:" + msg.status + "," +msg.statusText)

            }})


        })

    })

</script>

</html>
