<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../../include/head.jsp"></jsp:include>
    <title>getBoard(공지사항 등록하기)</title>
</head>
<body>
<jsp:include page="../../include/header.jsp"></jsp:include>
     <div class="boarddiv">
        <section class="page" id="page1">
            <div class="breadcrumb">
                <p><a href="">홈</a><a href="">커뮤니티</a><span>공지사항 수정하기</span></p>
            </div>
            <hr>
            <h2 class="page_title">공지사항 수정하기</h2>
            <!--  -->
            <div class="page_wrap clr-fix">
                <form action="${path}/admin/upProBoard.do" method="post">
                    <!-- 수정할 게시물의 bno를 hidden 필드로 포함 -->
                    <input type="hidden" name="bno" value="${board.bno}">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" value="${board.title}" required><br>
                    <label for="content">Content:</label>
                    <textarea id="content" name="content" required>${board.content}</textarea><br>
                    <label for="author">Author:</label>
                    <input type="text" id="author" name="author" value="${board.author}" required><br>
                    <input type="hidden" name="visited" value="${board.visited}">
                    <input type="hidden" name="resdate" id="resdate" value="${board.resdate}">
                    <button type="submit">Submit</button>
                </form>
            </div>
            <a href="${path}/board/boardList.do">돌아가기 : back to boardList</a>
        </section>
    </div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
