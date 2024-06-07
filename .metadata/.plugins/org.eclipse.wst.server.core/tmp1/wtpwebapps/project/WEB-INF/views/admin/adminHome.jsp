<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE>
<html lang="ko">
<head>
	<title>Home</title>
	<jsp:include page="../include/head.jsp"></jsp:include> 
</head>
<body>
<header>
	<jsp:include page="../include/header.jsp"></jsp:include>
</header>

<h1>
	관리자 페이지 
</h1>

<h3>상품 관리</h3>
<p><a href="${path}/admin/product/productList.do">productList</a></p>

<h3>재고 관리</h3>
<p><a href="${path}/product/productList.do">InventoryList</a></p>

<h3>회원 관리</h3>
<p><a href="${path}/admin/qna/qnaList.do">qnaList</a></p>

<c:if test="${sessionScope.smcode==0}">
	<h3>서브관리자 관리</h3>
	<p><a href="${path}/admin/">subAdminList</a></p>
</c:if>

<h3>공지사항 관리</h3>
<p> <a href="${path}/admin/notice/noticeList.do">noticeList</a></p>

<h3>faq 관리</h3>
<p><a href="${path}/admin/faq/faqList.do">faqList</a></p>

<h3>qna 관리</h3>
<p><a href="${path}/admin/qna/qnaList.do">qnaList</a></p>

<h3>상품별 qna 관리</h3>
<p><a href="${path}/admin/">productQnaList</a></p>

<h3>A/S문의</h3>
<p><a href="${path}/admin/">A/S</a></p>


<footer>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
