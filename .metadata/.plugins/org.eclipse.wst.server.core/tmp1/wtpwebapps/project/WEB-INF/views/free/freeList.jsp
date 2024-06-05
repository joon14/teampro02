<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유 게시판</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .table-container {margin-top: 50px;}
        .title {margin-top: 20px;}
        .button { margin-top: 10px;}
    </style>
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>
    <section class="section">
        <div class="container">
            <h1 class="title has-text-centered">자유 게시판</h1>

            <div class="table-container">
                <table class="table is-fullwidth is-striped">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="free" items="${freeList}">
                            <tr>
                                <td>${free.no}</td>
                                <td><a href="${path}/free/getFree.do?no=${free.no}">${free.title}</a></td>
                                <td>${free.content}</td>
                                <td>${free.name}</td>
                                <td><fmt:formatDate value="${free.resdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${free.hits}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="has-text-centered">
                <a class="button is-primary" href="${path}/free/insFree.do">글쓰기</a>
            </div>
        </div>
    </section>
    
<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
