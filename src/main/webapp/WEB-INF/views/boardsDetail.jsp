<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-11
  Time: 오후 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardsDetail.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<div class="container" id="detail">
    <table class="table table-hover">
        <tr>
            <th>id</th>
            <td>${boards.id}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${boards.boardTitle}</td>
        </tr>
        <tr>
            <th>writer</th>
            <td>${boards.boardWriter}</td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${boards.boardHits}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>${boards.boardCreatedDate}</td>
        </tr>
        <tr>
            <th>contents</th>
            <td>${boards.boardContents}</td>
        </tr>
    </table>
    <c:if test="${sessionScope.loginEmail == boards.boardWriter}">
    <button class="btn btn-danger" onclick="deleteFn()">삭제</button>
    <button class="btn btn-secondary" onclick="updateFn()">수정</button>
    </c:if>
    <c:if test="${sessionScope.loginEmail == null}">
        <button class="btn btn-primary" onclick="indexFn()">index</button>
    </c:if>
    <c:if test="${sessionScope.loginEmail != null}">
        <button class="btn btn-primary" onclick="paging()">뒤로가기</button>
        <button class="btn btn-primary" onclick="logout()">로그아웃</button>
    </c:if>

</div>
<div class="container mt-5" id="comment-write">
    <div class="input-group-sm mb-3">
        <div class="form-floating">
            <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
            <label for="commentWriter">작성자</label>
        </div>
        <div class="form-floating">
            <input type="text" id="commentContents" class="form-control" placeholder="내용">
            <label for="commentContents">내용</label>
        </div>
        <button id="comment-write-btn" class="btn btn-secondary" onclick="commentWrite()">댓글작성</button>
        <button class="btn btn-check" onclick="index()">index</button>
    </div>
</div>
</body>
<div class="container mt-5" id="comment-list">
    <table class="table">
        <tr>
            <th>댓글번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>작성시간</th>
        </tr>
        <c:forEach items="${commentList}" var="comment">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.commentWriter}</td>
                <td>${comment.commentContents}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    const commentWrite = () =>{
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;
        const board = '${boards.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: writer,
                commentContents: contents,
                boardId: board
            },
            dataType: "json",
            success: function (commentList){
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in commentList){
                    output += "<tr>";
                    output += "<td>"+commentList[i].id+"</td>";
                    output += "<td>"+commentList[i].commentWriter+"</td>";
                    output += "<td>"+commentList[i].commentContents+"</td>";
                    output += "<td>"+moment(commentList[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value='';
                document.getElementById('commentContents').value='';
            },
            error: function () {
                console.log("실패");
            }
        });
    }

    const deleteFn = () => {
        const id = '${boards.id}';
        location.href = "/deleteCheck?id=" + id;
    }

    const updateFn = () => {
        const id = '${boards.id}';
        location.href = "/update?id=" + id;
    }

    const index = () => {
        location.href = "/";
    }

    const logout = () => {
        location.href = "/logout";
    }

    const paging = () => {
        location.href = "/paging";
    }

</script>
</html>
