<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 上午11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>post</title>
</head>
<body>
<h1>咸鱼玩家</h1>
<h1 id="hh"></h1>
<button id="btn">点此显示答案</button>
</body>
<script>

    function createXMLHttpRequest() {
        try {
            return new XMLHttpRequest();//大多数浏览器
        } catch (e) {
            try {
                return ActvieXObject("Msxml2.XMLHTTP");//IE6.0
            } catch (e) {
                try {
                    return ActvieXObject("Microsoft.XMLHTTP");//IE5.5及更早版本
                } catch (e) {
                    alert("哥们儿，您用的是什么浏览器啊？");
                    throw e;
                }
            }
        }
    }

    document.getElementById("btn").onclick = function () {

        var xmlHttp = createXMLHttpRequest();

        xmlHttp.open("post", "/AServlet", true);

        // 2. 请求头
        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

        // 3. 请求体
        xmlHttp.send("username=小黑&password=520");

        xmlHttp.onreadystatechange = function () {

            if(xmlHttp.status == 200 && xmlHttp.readyState == 4){

                document.getElementById("hh").innerHTML = xmlHttp.responseText;

            }

        }

    }

</script>
</html>
