<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-16
  Time: 오전 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberDetail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <table class="table table-striped">
        <tr>
            <th>id</th>
            <td>${members.id}</td>
        </tr>
        <tr>
            <th>memberEmail</th>
            <td>${members.memberEmail}</td>
        </tr>
        <tr>
            <th>memberPassword</th>
            <td>${members.memberPassword}</td>
        </tr>
        <tr>
            <th>memberName</th>
            <td>${members.memberName}</td>
        </tr>
        <tr>
            <th>memberMobile</th>
            <td>${members.memberMobile}</td>
        </tr>
    </table>
</div>
</body>
</html>
