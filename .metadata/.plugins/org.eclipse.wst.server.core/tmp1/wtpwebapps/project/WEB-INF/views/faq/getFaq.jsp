<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View FAQ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section class="section">
        <div class="container">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="${path}">Home</a></li>
                    <li><a href="${path}/faq/faqList.do">FAQ List</a></li>
                    <li class="is-active"><a href="#" aria-current="page">View FAQ</a></li>
                </ul>
            </nav>
            <h2 class="title">View FAQ</h2>
            <div class="box">
            <input type="hidden" name="fno" value="${faq.fno}" />
                <table class="table is-fullwidth">
                    <tr>
                        <th>Title</th>
                        <td>${faq.ftitle}</td>
                    </tr>
                    <tr>
                        <th>Content</th>
                        <td>${faq.fcontent}</td>
                    </tr>
                    <tr>
                        <th>Date</th>
                        <td>${faq.resdate}</td>
                    </tr>
                </table>
            </div>
            <a href="${path}/faq/faqList.do" class="button is-link">Back to FAQ List</a>
            <a href="${path}/faq/upFaq.do?fno=${faq.fno}" class="button is-link">update FAQ </a>
            <a href="${path}/faq/delFaq.do?fno=${faq.fno}" class="button is-link">delete FAQ </a>
            
        </div>
    </section>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
                    
