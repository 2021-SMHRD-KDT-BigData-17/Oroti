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
	UserVO user = (UserVO) session.getAttribute("SignIn");

String Userid = user.getUserid();
String username = user.getUsername();
String useremail = user.getUseremail();
String userphone = user.getUserphone();
String userobstccode = user.getUserobstccode();
String userparentphone = user.getUserparentphone();
Character userdiv = (Character) user.getUserdiv();
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
				<a href="${path}/MainPage.do"> <!-- 메인페이지 링크 --><img src="${path}/resources/img/logo.png" alt="logo">포용취업넷
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
				<a href="${path}/MainPage.do" class="hire">채용정보</a> <a
					href="${path}/Chart.do" class="job">취업 분포도</a> <a
					href="${path}/Career.do" class="career">직업·진로</a>
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
				<a href="#" class="customer">고객센터</a>
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>

	<!-- 내 정보 시작 -->
	<div class="myinfo_wrapper">
		<div class="myinfo">
			<form action="${path}/Usermyinfoedit.do" method="post">
				<table class="edit_area">
					<tr class="user_id">
						<td class="edit_list">아이디</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%=Userid%> 
						</td>
					</tr>
					<tr class="user_pw">
						<td class="edit_list">비밀번호</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<input
							class="edit_pw" name="userpw" type="password"></td>
					</tr>
					<tr class="user_name">
						<td class="edit_list">이름</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<%=username%></td>
					</tr>
					<tr class="user_phone">
						<td class="edit_list">연락처</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<input
							class="edit_pw" name="userphone" type="text"></td>
					</tr>
					<tr class="user_email">
						<td class="edit_list">이메일</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<input
							class="edit_pw" name="useremail" type="email"></td>
					</tr>
					<tr class="disability_type">
						<td class="edit_list">장애유형</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp; 
						<select	class="disability" name="userobstccode">
								<option value="0" >해당 없음</option>
								<option value="1" >지체장애</option>
								<option value="2" >뇌병변장애</option>
								<option value="3" >시각장애</option>
								<option value="4">청각장애</option>
								<option value="5" >언어장애</option>
								<option value="6" >지적장애</option>
								<option value="7" >자폐성장애</option>
								<option value="8" >정신장애</option>
								<option value="9" >신장장애</option>
								<option value="10">심장장애</option>
								<option value="11" >호흡기장애</option>
								<option value="12">간장애</option>
								<option value="13">안면장애</option>
								<option value="14">장루/요루장애</option>
								<option value="15">뇌전증장애</option>
						</select>
						</td>
					</tr>
					<tr class="user_parent_phone">
						<td class="edit_list">보호자 연락처</td>
						<td class="edit_content">&nbsp;&nbsp;&nbsp;<input
							class="edit_pw" name="userparentphone" type="text"></td>
					</tr>
				</table>
				<input type="hidden" name="userid" id="userid"	value="<%=Userid%>">
				<input type="hidden" name="userdiv" id="userdiv" value="<%=userdiv%>">
				<a href="${path}/UserMyinfo.do"><button class="edit_btn" type="button">수정</button></a>
				<button class="cancle_btn">취소</button>
			</form>
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