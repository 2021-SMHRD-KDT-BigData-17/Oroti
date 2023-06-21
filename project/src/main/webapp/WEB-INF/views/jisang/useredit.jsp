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
String userbirth = user.getUserbirth();
String useraddress = user.getUseraddress();
Character userdiv = (Character) user.getUserdiv();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myinfo_1</title>
<link rel="stylesheet" href="${path}/resources/css/userMyinfo.css">
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
                <a href="${path}/service.do" class="customer">고객센터</a><!-- 고객센터 페이지 링크 -->
				<!-- 고객센터 페이지 링크 -->
			</div>
		</div>
		<!-- 헤더 두 번째 줄 (끝) -->
	</header>

	<!-- 전체를 감싼 부분 (시작) -->
	<div class="all">

		<div class="myinfo_wrap">
			<!-- 내정보 수정 (시작) -->
			<section>

				<!-- 개인정보 수정 (시작) -->
				<form action="${path}/Usermyinfoedit.do" method="post">
					<div class="personal_info_wrap">
						<input type="hidden" value ="<%=Userid%>" name ="userid">
						<div class="personal_info_left">
							<div class="personal_id">
								<div class="id_title">아이디</div>
								<div class="id_content"><%=Userid %></div>
							</div>

							<div class="personal_pw">
								<div class="pw_title">비밀번호</div>
								<div class="pw_content">
									<input type="password" name="userpw" required>
								</div>
							</div>

							<div class="personal_email">
								<div class="email_title">이메일</div>
								<div class="email_content">
									<input type="email" name="useremail" required>
								</div>
							</div>

							<div class="personal_name">
								<div class="name_title">이름</div>
								<div class="name_content"><%=username%></div>
							</div>

							<div class="personal_birth">
								<div class="birth_title">생년월일</div>
								<div class="birth_content">
									<input type="date" name="userbirth" required>
								</div>
							</div>
						</div>
						<!-- 개인정보 왼쪽 (끝) -->

						<!-- 개인정보 오른쪽 (시작) -->
						<div class="personal_info_right">
							<div class="personal_address">
								<div class="address_title">주소</div>
								<div class="address_content">
									<input type="text" name ="useraddress" required>
								</div>
							</div>

							<div class="personal_phone">
								<div class="phone_title">전화번호</div>
								<div class="phone_content">
									<input type="text" name = "userphone" onkeypress="onlyNum();" maxlength="11">
								</div>
							</div>

							<div class="personal_parent">
								<div class="parent_title">보호자 전화번호</div>
								<div class="parent_content">
									<input type="text" name="userparentphone" onkeypress="onlyNum();" maxlength="11">
								</div>
							</div>

							<div class="personal_disorder">
								<div class="disorder_title">장애유형</div>
								<div class="disorder_content">
									<select name="userobstccode" required>
										<option disabled selected id="check">장애여부 선택</option>
										<!-- 기본값이라 value나 name 불러올 필요 없음 -->
										<option value="0" class="opt" >해당 없음</option>
										<option value="1" class="opt" >지체장애</option>
										<option value="2" class="opt">뇌병변장애</option>
										<option value="3" class="opt" >시각장애</option>
										<option value="4" class="opt" >청각장애</option>
										<option value="5" class="opt" >언어장애</option>
										<option value="6" class="opt" >지적장애</option>
										<option value="7" class="opt" >자폐성장애</option>
										<option value="8" class="opt" >정신장애</option>
										<option value="9" class="opt" >신장장애</option>
										<option value="10" class="opt" >심장장애</option>
										<option value="11" class="opt" >호흡기장애</option>
										<option value="12" class="opt" >간장애</option>
										<option value="13" class="opt" >안면장애</option>
										<option value="14" class="opt" >장루/요루장애</option>
										<option value="15" class="opt" >뇌전증장애</option>
									</select>
								</div>
							</div>
						</div>
						<!-- 개인정보 오른쪽 (끝) -->

					</div>

					<div class="personal_btn">
						<button type="submit">수정</button>
						<a href="${path}/UserMyinfo.do">취소</a>
					</div>
				</form>
				<!-- 개인정보 수정 (끝) -->
			</section>
			<!-- 내정보 수정 (끝) -->


			<!-- 오른쪽 사이드 바 (시작) -->
			<aside>
				<div class="menu">
					<div class="menu_top">
						<a href="${path}/resumeresult.do">이력서 조회</a>
					</div>
					<div class="menu_bottom">
						<a href="service.html">문의·신고 내역</a>
					</div>
				</div>
			</aside>
			<!-- 오른쪽 사이드 바 (끝) -->
		</div>
	</div>
	<!-- 전체를 감싼 부분 (끝) -->


	<div class="job_summary">
		<div class="job_wrap">
			<div class="job_wrap2">
				<!-- 구직활동 요약표 (시작) -->
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
							<p class="summary_title">입사 지원</p>
						</td>
						<td class="like_company">
							<p class="count">1</p>
							<p class="summary_title">관심 기업</p>
						</td>
					</tr>
				</table>
				<!-- 구직활동 요약표 (끝) -->
			</div>

			<div class="job_summary_btn">
				<button class="out">회원탈퇴</button>
			</div>
		</div>
	</div>


	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>
</body>
</html>