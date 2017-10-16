<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 下午2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>04_ajax_json</title>
</head>
<body>

<button id="btn1">点我点我~ Get</button>
<button id="btn2">点我点我~ Post</button>
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

    document.getElementById("btn2").onclick = function () {

        var xmlHttp = createXMLHttpRequest();

        xmlHttp.open("post","/BServlet",true);

        xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

        xmlHttp.send(null);

        xmlHttp.onreadystatechange = function () {

            if(xmlHttp.status == 200 && xmlHttp.readyState == 4){

                var json = xmlHttp.responseText;

                var perList = eval("("+json+")");

                var str = "";

                for(var i = 0 ; i< perList.length ; i++){

                    str = str +"\nname:"+perList[i].name + ",age:" + perList[i].age +",sex:" + perList[i].sex

                }

                alert(str);


            }

        }

    };

    document.getElementById("btn1").onclick = function () {

        var xmlHttp = createXMLHttpRequest();

        xmlHttp.open("get","/BServlet",true);

        xmlHttp.send(null);

        xmlHttp.onreadystatechange = function () {

            if(xmlHttp.status == 200 && xmlHttp.readyState == 4){


                var json = xmlHttp.responseText;

                var per = eval("("+json+")");

                alert("name:"+per.name+",age:"+per.age+",sex:"+per.sex);

            }

        }

    }

</script>
</html>
