<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-15
  Time: 오후 4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deleteCheck.jsp</title>
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
  <input type="text" id="boardPass" class="form-control" placeholder="비밀번호">
  <button class="btn btn-secondary" onclick="passCheck()">확인</button>
</div>
</body>
<script>
  const passCheck = () => {
    const passInput = document.getElementById("boardWriter").value;
    const passDB = ${boards.boardWriter};
    const id = ${boards.id};
    if (passInput == passDB) {
      location.href = "/delete?id=" + id;
    } else {
      alert("작성자가 일치하지 않습니다");
    }
  }
</script>
</html>
