<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-16
  Time: 오전 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>memberList</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <table class="table table-striped table-hover">
        <tr>
            <th>id</th>
            <th>email</th>
            <th>password</th>
            <th>name</th>
            <th>mobile</th>
            <th>삭제</th>
            <th>조회</th>
        </tr>
        <c:forEach items="${memberList}" var="members">
        <tr>
            <td>${members.id}</td>
            <td>${members.memberEmail}</td>
            <td>${members.memberPassword}</td>
            <td>${members.memberName}</td>
            <td>${members.memberMobile}</td>
            <td>
                <button class="btn btn-danger" onclick="deleteMember('${members.id}')">삭제</button>
            </td>
            <td>
                <button class="btn btn-primary" onclick="findMember('${members.id}')">조회</button>
            </td>
        </tr>
        </c:forEach>
</div>
</body>
<script>
const findMember = (clickId) => {
    const id = '${members.id}';
    location.href = "/findId?id=" + clickId;
}
const deleteMember = (clickId) => {
    const id = '${members.id}';
    location.href = "/memberDeleteCheck?id=" + clickId;
}
</script>
</html>
