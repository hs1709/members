<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardsSave.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #write-form{
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container" id="write-form">
    <form action="/board/save" method="post" enctype="multipart/form-data">
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}">
        <input type="text" name="boardTitle" class="form-control" placeholder="제목">
        <textarea name="boardContents" cols="30" rows="10" class="form-control" placeholder="내용을 입력하세요"></textarea>
        <input type="submit" value="작성" class="btn btn-primary">
    </form>
</div>
</body>
</html>
