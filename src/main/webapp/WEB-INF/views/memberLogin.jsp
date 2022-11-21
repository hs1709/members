<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오후 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberLogin.jsp</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <form action="/login" method="post">
        <input type="text" class="form-control" placeholder="이메일" name="memberEmail">
        <input type="text" class="form-control" placeholder="비밀번호" name="memberPassword">
        <input type="submit" value="로그인" class="btn btn-primary">
    </form>
</div>
</body>
</html>
