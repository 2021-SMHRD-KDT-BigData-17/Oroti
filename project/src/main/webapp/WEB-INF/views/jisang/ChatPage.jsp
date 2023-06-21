<%@page import="jisang.poyong.vo.ChatVO"%>
<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	UserVO userid = (UserVO) session.getAttribute("SignIn");
%>
<%
	ChatVO chat;
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>notice</title>
<link rel="stylesheet" href="${path}/resources/css/message.css">
<!-- <link rel="stylesheet" href="header.css"> -->
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
					href="${path}/Chart.do" class="job">취업 분포도</a>

			</div>

			<div class="nav2_right">
				<a href="#" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>


	<div class="all">
		<!-- 쪽지 리스트 (시작) -->
		<aside>
			<nav class="sidebar">
				<h3>쪽지</h3>
				<ul class="scrollbox">
					<li>1번째 기업</li>
					<li>2번째 기업</li>
					<li>3번째 기업</li>
					<li>4번째 기업</li>
					<li>5번째 기업</li>
				</ul>
			</nav>
		</aside>
		<!-- 쪽지 리스트 (끝) -->


		<!-- 채팅창 (시작) -->
		<section class="chat_wrap">
			<div class="chat_screen">

				<!-- 첫 번째 기업 (시작) -->
				<div class="full_chat" id="form1">

					<!-- 기업회원 (시작) -->
					<c:forEach var="chat" items="${chatList}">
						<c:choose>
							<c:when test="${chat.senduser eq currentUser.userid}">
								<!-- 우측 -->
								<div class="chat_content_wrap2">
									<div class="chat_content2">${chat.chattext}</div>
									 <div class="chat_content_time">${chat.chattime}</div>
								</div>
								<!-- 우측 -->
							</c:when>
							<c:otherwise>
								<!-- 좌측 -->
								<div class="chat_content_wrap1">
									<div class="chat_content1">${chat.chattext}</div>
									 <div class="chat_content_time">${chat.chattime}</div>
								</div>
								<!-- 좌측 -->
							</c:otherwise>
						</c:choose>
						<!-- 개인회원 (끝) -->
					</c:forEach>
				</div>
				<!-- 첫 번째 기업 (끝) -->


			
			</div>


			<!-- 채팅 입력, 전송 부분 (시작) -->
			<div class="chat_bottom">
		<form action="${path}/SendChat.do" method="post" class="chat_form">
			<input type="hidden" name="senduser" id="senduser"
				value="<%=userid%>">
			<div class="chat_input">
				<textarea name="chattext" class="input_value"></textarea>
			</div>
			<div class="chat_btn">
				<div class="tts_stt">
					<!-- 버튼말고 div로 바꾸고 기능을 js로 구현해야할 듯(form 때문에 누를 때마다 새로고침됨) -->
					<button class="chat_tts" type="button">
						<i class="fa-solid fa-volume-high"></i>
					</button>
					<button class="chat_stt" type="button">
						<i class="fa-solid fa-microphone"></i>
					</button>
				</div>
				<div class="submit_btn">
					<button type="submit">전송</button>
				</div>
			</div>
		</form>
	</div>
			<!-- 채팅 입력, 전송 부분 (끝) -->
		</section>
		<!-- 채팅창 (끝) -->
	</div>

	<!-- <div class="modal">
        <div class="modal_content"></div>
    </div> -->

	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resources/js/message.js"></script>
</body>
</html>