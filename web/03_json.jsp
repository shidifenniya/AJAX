<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/9/27
  Time: 上午11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>03_json</title>
</head>
<body>


</body>

<script>

    var perStr = "{\"name\":\"杨过\",\"age\":12,\"sex\":\"men\"}"

    var per = eval("("+perStr+")");

    alert(per.name + "," + per.age + "," + per.sex);

</script>
</html>
