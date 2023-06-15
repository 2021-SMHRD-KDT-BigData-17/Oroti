<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%

	UserVO user = (UserVO) session.getAttribute("SignIn");

	String Userid = user.getUserid();
	String username = user.getUsername();
	String useremail = user.getUseremail();
	String userphone = user.getUserphone();
	String userobstccode = user.getUserobstccode();
	String userparentphone = user.getUserparentphone();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myinfo_1</title>
<link rel="stylesheet" href="${path}/resources/css/usermyinfo.css">
</head>
<body>
	<header>
		<!-- 헤더 첫 번째 줄 (시작)-->
		<div class="nav1">
			<div class="nav1_left">
				<a href="#"> <!-- 메인페이지 링크 --> <img src="img/logo.png"
					alt="logo">포용취업넷
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
									<a href="${path}/CompanyMyinfo.do" class="myPage">내정보</a>
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
				<a href="#" class="hire">채용정보</a> <a href="#">취업 분포도</a> <a href="#">직업·진로</a>
				<a href="#">이력서 작성</a>
			</div>

			<div class="nav2_right">
				<a href="#" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>

	<!-- 내 정보 시작 -->
	<div class="myinfo_wrapper">
		<div class="myinfo">
				<table class="edit_area">
					<tr class="user_id">
						<td class="edit_list">아이디</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= Userid %></td>
					</tr>
					<tr class="user_name">
						<td class="edit_list">이름</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= username %></td>
					</tr>
					<tr class="user_phone">
						<td class="edit_list">연락처</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= userphone %></td>
					</tr>
					<tr class="user_email">
						<td class="edit_list">이메일</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= useremail %></td>
					</tr>
					<tr class="disability_type">
						<td class="edit_list">장애유형</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= userobstccode %></td>
					</tr>
					<tr class="user_parent_phone">
						<td class="edit_list">보호자 연락처</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%= userparentphone %></td>
					</tr>
				</table>
				<a href="${path}/Useredit.do"><button class="edit_btn" type="button">수정</button></a>
		</div>

		<div class="side">
			<table class="side_menu">
				<tr id="side_menu_content">
					<td>이력서 <br>수정
					</td>
				</tr>
				<tr id="side_menu_content_2">
					<td>문의·신고 <br>내역
					</td>
				</tr>
			</table>

			<button class="out">회원탈퇴</button>
		</div>

		<!-- 구직활동요약표 시작 -->
		<div class="job_summary">
			<table class="summary_table">
				<tr class="summary">
					<td class="resume">
						<p class="count">1</p>
						<p class="summary_title">내 이력서</p>
					</td>
					<td class="resume_see">
						<p class="count">1</p>
						<p class="summary_title">이력서 열람</p>
					</td>
					<td class="apply">
						<p class="count">1</p>
						<p class="summary_title">입사지원</p>
					</td>
					<td class="like_company">
						<p class="count">1</p>
						<p class="summary_title">관심기업</p>
					</td>
				</tr>
			</table>
		</div>

	</div>
	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
	<script src="header.js"></script>
</body>
</html>