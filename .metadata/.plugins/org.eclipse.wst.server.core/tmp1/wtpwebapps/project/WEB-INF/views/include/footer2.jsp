<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="fpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>푸터 예시</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            margin: 0;
            padding: 0;
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 40px 0;
            text-align: center;
        }
        .footer .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .footer .links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        .footer .links a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
            font-size: 14px;
        }
        .footer .links a:hover {
            text-decoration: underline;
        }
        .footer .social-media {
            margin-bottom: 20px;
        }
        .footer .social-media a {
            color: #fff;
            margin: 0 10px;
            font-size: 20px;
        }
        .footer .social-media a:hover {
            color: #007BFF;
        }
        .footer .family-sites {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .footer .family-sites a {
            color: #fff;
            margin: 0 10px;
            text-decoration: none;
            font-size: 14px;
        }
        .footer .family-sites a:hover {
            text-decoration: underline;
        }
        .footer .copyright {
            margin-top: 20px;
            font-size: 12px;
            color: #aaa;
        }
    </style>
</head>
<body>
    <footer class="footer">
        <div class="container">
            <div class="links">
                <a href="#">개인정보처리방침</a>
                <a href="#">회원이용약관</a>
                <a href="#">이메일무단수집거부</a>
                <a href="#">공정거래자율준수</a>
            </div>
            <div class="social-media">
                <a href="https://www.facebook.com" target="_blank">Facebook</a>
                <a href="https://www.twitter.com" target="_blank">Twitter</a>
                <a href="https://www.youtube.com" target="_blank">YouTube</a>
                <a href="https://www.instagram.com" target="_blank">Instagram</a>
            </div>
            <div class="family-sites">
                <a href="#">하이트진로 홀딩스</a>
                <a href="#">진로 아메리카</a>
                <a href="#">하이트진로음료㈜</a>
                <a href="#">블루헤런</a>
                <a href="#">진로 재팬</a>
            </div>
            <div class="copyright">
                &copy; 2024 하이트진로. All Rights Reserved.
            </div>
        </div>
    </footer>
</body>
</html>
