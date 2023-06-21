<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%
	UserVO user = (UserVO) session.getAttribute("SignIn");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포용취업넷</title>
<link rel="stylesheet" href="${path}/resources/css/service.css">
</head>
<body>
	<header>
		<!-- 헤더 첫 번째 줄 (시작)-->
		<div class="nav1">
			<div class="nav1_left">
				<a href="${path}/MainPage.do"> <!-- 메인페이지 링크 --> <img
					src="${path}/resources/img/logo.png" alt="logo">포용취업넷
				</a>
			</div>

			<div class="nav1_center">
				<input type="text" class="search">
				<button>
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>

			<div class="nav1_right">
				<div class="link_wrap">
					<!-- 로그인 전에는 "로그인, 회원가입" 버튼만 보이게, 나머지는 숨김 처리 -->
					<c:choose>
						<c:when test="${not empty SignIn}">
							<c:choose>
								<c:when test="${String.valueOf(SignIn.userdiv) eq 'A'}">
									<a href="${path}/UserMyinfo.do" class="myPage">내정보</a>
								</c:when>
								<c:when test="${String.valueOf(SignIn.userdiv) eq 'B'}">
									<a href="${path}/business2.do" class="myPage">내정보</a>
								</c:when>
							</c:choose>
							<a href="${path}/ChatPage.do" class="message">쪽지함</a>
							<a href="${path}/Logout.do" class="LogOutBtn">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- 로그인 세션값이 없는 경우 -->
							<div class="SignUp_nav">
								<a href="${path}/SignIn.do" class="siBtn">로그인</a> <a
									href="${path}/SignUp.do" class="suBtn">회원가입</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 헤더 첫 번째 줄 (끝) -->


		<!-- 헤더 두 번째 줄 (시작) -->
		<div class="nav2">
			<div class="nav2_left">
				<a href="${path}/MainPage.do" class="hire">채용정보</a> <a
					href="${path}/Chart.do" class="job">취업 분포도</a> <a
					href="${path}/preference.do" class="career">직업·진로</a>
				<c:choose>
					<c:when test="${not empty SignIn}">
						<c:choose>
							<c:when test="${String.valueOf(SignIn.userdiv) eq 'A'}">
								<a href="${path}/Resume.do" class="resume">이력서 작성</a>
							</c:when>
							<c:when test="${String.valueOf(SignIn.userdiv) eq 'B'}">
								<a href="${path}/business.do" class="resume">공고글 작성</a>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
			</div>

			<div class="nav2_right">
				<a href="${path}/service.do" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>


	<div class="service_wrap">
		<div class="service_form">
			<h2>문의·신고</h2>
			<!-- 전송할 문의 내용 (시작) -->
			<form action="#" method="#">
				<div class="service_content">
					<!-- 첫 번째 줄 (시작) -->
					<div class="service_line1">
						<div class="line1_title">문의 종류 (필수)</div>
						<div class="line1_content">
							<select name="service_type" required>
								<option disabled selected>선택</option>
								<option value="0">서비스 이용문의</option>
								<option value="1">불량정보·오류 신고</option>
								<option value="2">서비스 제안·칭찬</option>
							</select>
						</div>
					</div>
					<!-- 첫 번째 줄 (끝) -->

					<!-- 두 번째 줄 (시작) -->
					<div class="service_line2">
						<div class="line2_title">문의 내용 (필수)</div>
						<div class="line2_content">
							<textarea name="" id=""></textarea>
						</div>
					</div>
					<!-- 두 번째 줄 (끝) -->

					<!-- 세 번째 줄 (시작) -->
					<div class="service_line3">
						<div class="line3_title">파일첨부</div>
						<div class="line3_content">
							<input type="file">
						</div>
					</div>
					<!-- 세 번째 줄 (끝) -->
				</div>

				<div class="service_btn">
					<a href="${path}/MainPage.do" class="go">등록</a> <a href="${path}/MainPage.do">취소</a>
				</div>
			</form>
			<!-- 전송할 문의 내용 (끝) -->
		</div>
	</div>

	<footer>
		<div class="footer">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>
		<div class="copyright">copyright &copy; 2023 포용취업넷 All rights
			reserved</div>
	</footer>

</body>
</html>