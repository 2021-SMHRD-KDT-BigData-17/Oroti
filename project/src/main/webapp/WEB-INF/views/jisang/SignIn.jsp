<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

      <link rel="stylesheet" href="${path}/resources/css/SignIn.css">
</head>
<body>
    <div class="SignIn_wrap">

        <!-- 첫 화면으로 이동 (시작) -->
        <div class="send_home">
            <a href="#"><!-- 메인페이지 파일 경로 -->
                첫 화면으로 이동
            </a>
        </div>
        <!-- 첫 화면으로 이동 (끝) -->
    
    
        <div class="container">
    
            <!-- 로그인/회원가입 이동 버튼 (시작) -->
            <div class="SignIn_nav">
                <a href="<c:url value='/SignIn.do'/>" class="siBtn">로그인</a>
                <a href="<c:url value='/SignUp.do'/>" class="suBtn">회원가입</a>
            </div>
            <!-- 로그인/회원가입 이동 버튼 (끝) -->
			<c:choose>
					<c:when test="${empty SignIn}">
            <!-- 로그인 폼 (시작) -->
            <form action="${path}/SignIn2.do" method="post"><!-- action : spring 파일 경로, method : get / post (백엔드 부분) -->
                <!-- 회원 유형 선택 (시작) -->
                <div class="user_mode">
                    <label>
                        <input type="radio" name="userdiv" value="A" checked required>개인회원
                    </label>
                    <label>
                        <input type="radio" name="userdiv" value="B" required>기업회원
                    </label>
                </div>
                <!-- 회원 유형 선택 (끝) -->
                <!-- 정보 입력 (시작) -->
                <div class="user_info_wrap">
                    <div class="user_info">
                        <input type="text" id="userid" name="userid" placeholder="아이디" required>
                    </div>
                    <div class="user_info">
                        <input type="password" id="userpw" name="userpw" placeholder="비밀번호" required>
                    </div>
                    
                    <button type="submit" class="btn">로그인</button>
                </div>
                <!-- 정보 입력 (끝) -->
            </form> 
            <!-- 로그인 폼 (끝) -->
            </c:when>
            </c:choose>
        </div>

    </div>
</body>
</html>