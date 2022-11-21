<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-16
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberDeleteCheck.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #delete-check {
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container" id="delete-check">
    <input type="text" id="memberEmail" class="form-control" placeholder="이메일">
    <button class="btn btn-secondary" onclick="passCheck()">확인</button>
</div>
</body>
<script>
    const passCheck = () => {
        const passInput = document.getElementById("memberEmail").value;
        const passDB = ${members.memberEmail};
        const id = ${members.id};
        if (passInput == passDB) {
            location.href = "/memberDelete?id=" + id;
        } else {
            alert("작성자가 일치하지 않습니다");
        }
    }
</script>
</html>
