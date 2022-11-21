<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-14
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>boardPaging.jsp</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <th>id</th>
            <th>title</th>
            <th>writer</th>
            <th>date</th>
            <th>hits</th>
        </tr>
        <c:forEach items="${boardsList}" var="boards">
            <tr>
                <td>${boards.id}</td>
                <td>
                    <a href="/findById?id=${boards.id}&page=${paging.page}">${boards.boardTitle}</a>
                        <%-- 클릭하면 상세 조회로 연결된다, 물음표 이전이 주소, 이후가 보내는 데이터다 --%>
                </td>
                <td>${boards.boardWriter}</td>
                <td>
                    <fmt:formatDate value="${boards.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </td>
                <td>${boards.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재 페이지보다 1 작은 페이지 요청 --%>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <%--  for(int i=startPage; i<=endPage; i++)      --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 요청한 페이지에 있는 경우 현재 페이지 번호는 텍스트만 보이게 --%>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재보다 1 작은 페이지 요청 --%>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/paging?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>

        </c:choose>
        <form action="/search" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
            <div class="input-group">
                <select name="type" class="form-select">
                    <option value="boardTitle" selected>제목</option>
                    <option value="boardWriter">작성자</option>
                </select>
                <input type="search" name="q" class="form-control form-control-dark text-bg-dark"
                       placeholder="Search..." aria-label="Search">
                <button class="btn btn-dark"><i class="bi bi-search"></i>검색</button>
            </div>
        </form>
    </ul>
    <button class="btn btn-primary" onclick="saveFn()">글작성</button>

    <c:if test="${sessionScope.loginEmail == null}">
        <button class="btn btn-primary" onclick="indexFn()">index</button>
    </c:if>
    <c:if test="${sessionScope.loginEmail != null}">
        <button class="btn btn-primary" onclick="updateFn()">마이페이지</button>
        <button class="btn btn-primary" onclick="logout()">로그아웃</button>
    </c:if>
    <c:if test="${sessionScope.loginEmail == 'admin'}">
        <button class="btn btn-danger" onclick="findAllFn()">회원목록</button>
    </c:if>

</div>

</body>
<script>
    const findAllFn = () => {
        location.href = "/findAll/";
    }
    const updateFn = () => {
        location.href = "/member-update";
    }
    const saveFn = () => {
        const id = '${boards.id}';
        location.href = "/board/save?id=" + id;
    }
    const indexFn = () => {
        location.href = "/";
    }
    const logout = () => {
        location.href = "/logout";
    }

</script>
</html>
