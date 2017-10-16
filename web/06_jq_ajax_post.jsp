<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ajax_post</title>
    <script src="jquery-3.2.1.js"></script>
</head>
<body>


<button id="btn">点击显示二表哥对象</button>

<table>

    <tr>
        <th>姓名</th>
        <th>年龄</th>
        <th>爱情宣言</th>
    </tr>

    <tbody id="tb"></tbody>

</table>

</body>

<script>

    $("#btn").click(function () {

        $.post({url:"/BServlet",dataType:"json",success:function (date) {

            var _html = "";

            $.each(date,function (i,cate) {

                alert(cate.name);

                _html += '<tr><td>' + cate.name + '</td>' +'<td>'+cate.age+'</td>'+'<td>'+cate.sex + '</td></tr>';

            });

            $("#tb").html(_html);


        }});

    })

</script>
</html>
