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
            <p><a href="../home.jsp">홈</a><a href="">커뮤니티</a><span>공지사항</span></p>
        </div>
        <hr>
        <h2 class="page_title">공지사항 등록하기</h2>
        <div class="page_wrap clr-fix">
		    <form action="${path}/admin/insProBoard.do" method="post">
		        <label for="title">Title:</label>
		        <input type="text" id="title" name="title" required><br>
		        <label for="content">Content:</label>
		        <textarea id="content" name="content" required></textarea><br>
		        <label for="author">Author:</label>
		        <input type="text" id="author" name="author" required><br>
		        <input type="hidden" name="visited" value="0">
		        <input type="hidden" name="resdate" id="resdate">
		        <button type="submit">Submit</button>
		    </form>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        document.getElementById('resdate').value = new Date().toISOString().slice(0, 10); // YYYY-MM-DD 형식으로 설정
    });
</script>
		<a href="${path}/board/boardList.do">돌아가기 : back to boardList</a>
	   </div>
    </section>
    </div>
<jsp:include page="../../include/footer.jsp"></jsp:include>
</body>
</html>
