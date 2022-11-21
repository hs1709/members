<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardsList.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
        #list{
            width: 800px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <td>id</td>
            <td>제목</td>
            <td>작성자</td>
            <td>조회수</td>
            <td>작성일</td>
        </tr>
        <c:forEach items="${boardsList}" var="boards">
            <tr>
                <td>${boards.id}</td>
                <td>
                    <a href="/findById?id=${boards.id}">${boards.boardTitle}</a>
                </td>
                <td>${boards.boardWriter}</td>
                <td>${boards.boardHits}</td>
                <td><fmt:formatDate value="${boards.boardCreatedDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
    <button class="btn btn-primary" onclick="saveFn()">글작성</button>
    <button class="btn btn-dark" onclick="logout()">로그아웃</button>
</div>

</body>
<script>
const saveFn = () => {
    const id = '${boards.id}';
    location.href = "/board/save?id=" + id;
}

const logout = () => {
    location.href = "/logout";
}

</script>
</html>
