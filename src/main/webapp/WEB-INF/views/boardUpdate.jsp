<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-15
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardUpdate.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #update-form {
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container" id="update-form">
    <form action="/boards/update" method="post" name="updateForm">
        <input type="text" name="id" value="${boards.id}" class="form-control" readonly>
        <input type="text" name="boardWriter" value="${boards.boardWriter}" class="form-control" readonly>
        <input type="text" name="boardTitle" value="${boards.boardTitle}" class="form-control">
        <textarea name="boardContents" cols="30" rows="10" class="form-control">
            ${boards.boardContents}
        </textarea>
        <input type="button" value="수정" onclick="updateForm()" class="btn btn-primary">
    </form>
</div>
</body>
<script>
    const updateForm = () => {
        const passInput = document.getElementById("boardWriter").value;
        const passDB = '${boards.boardWriter}';
        if (passInput == passDB) {
            document.updateForm.submit();
        } else {
            alert("작성자가 아닙니다!!")
        }
    }
</script>
</html>
