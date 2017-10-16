<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 上午10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>get</title>
</head>
<body>
<h1>dota咸鱼</h1>
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

        alert("1");

        // 1. 创建异步对象

        var xmlHttp = createXMLHttpRequest();

        // 2. 打开与服务器的连接
        // 第一个参数: method 请求方法
        // 第二个参数: url
        // 第三个参数: 是否异步
        xmlHttp.open("get","/AServlet", true);

        // 3. 发送请求
        xmlHttp.send(null);

        // 4. 给异步对象 ,增加事件监听
        xmlHttp.onreadystatechange = function () {

            // 当 xmlHttp 的状态发生改变时

            // 双重判断. xmlHttp 的状态是4(服务器响应结束) 并且服务器的响应状态码是 200
            if(xmlHttp.status == 200 && xmlHttp.readyState == 4){

                // 接收服务器发送过来的数据
                var text = xmlHttp.responseText;

                alert(text);

                var per = eval("("+text+")");

                document.getElementById("hh").innerHTML = per.name+ " " + per.message;

            }

        }

    };

</script>
</html>
