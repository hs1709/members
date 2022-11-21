<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-18
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberUpdate.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #update-form {
            width: 800px;
        }
    </style>
</head>
<body>
<div class="container" id="update-form">
    <form action="update" method="post" name="updateForm">
        id : <input type="text" name="id" value="${members.id}" class="form-control" readonly>
        email : <input type="text" name="email" value="${members.memberEmail}" class="form-control" readonly>
        password : <input type="text" name="password" value="${members.memberPassword}" class="form-control">
        Name : <input type="text" name="name" value="${members.memberName}" class="form-control">
        Mobile : <input type="text" name="mobile" value="${members.memberMobile}" class="form-control">
        <input type="button" value="수정" class="btn btn-primary" onclick="update()">
    </form>
</div>
</body>
<script>
    const update = () => {
        const passwordDB = '${members.memberPassword}'

        const password = document.getElementById("memberPassword").value;
        if (passwordDB == password) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다");
        }
    }
    }
</script>
</html>
