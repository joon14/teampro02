<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>자유 게시판 글쓰기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .form-container { margin-top: 50px; }
        .title { margin-top: 20px; }
        .button { margin-top: 20px; }
    </style>
    <script src="${path}/resources/js/ckeditor/ckeditor.js"></script>
</head>
<body>
<header>
    <jsp:include page="../include/header.jsp"></jsp:include>
</header>
<section class="section">
    <div class="container">
        <h1 class="title has-text-centered">자유 게시판 글쓰기</h1>
        <div class="form-container">
            <form action="${path}/free/insFree.do" method="post">
                <div class="field">
                    <label class="label">제목</label>
                    <div class="control">
                        <input class="input" type="text" name="title" placeholder="제목을 입력하세요" required>
                    </div>
                </div>

                <div class="field">
                    <label class="label">내용</label>
                    <div class="control">
                        <textarea class="textarea" name="content" placeholder="내용을 입력하세요" required></textarea>
                    </div>
                </div>
				

                <div class="field is-grouped">
                    <div class="control">
                        <button type="submit" class="button is-link">저장</button>
                    </div>
                    <div class="control">
                        <a href="${path}/free/freeList.do" class="button is-link is-light">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- CKEditor 초기화 스크립트 -->
            <script>
                // CKEditor 초기화
                CKEDITOR.replace('content', {
                    filebrowserUploadUrl: '${path}/free/fileupload.do' // 파일 업로드 URL 설정
                });
            </script>
<footer>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>