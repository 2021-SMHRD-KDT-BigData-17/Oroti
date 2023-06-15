<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>notice</title>
<link rel="stylesheet" href="${path}/resources/css/notice.css">
<!-- <link rel="stylesheet" href="header.css"> -->
</head>
<body>
	<header>
		<!-- 헤더 첫 번째 줄 (시작)-->
		<div class="nav1">
			<div class="nav1_left">
				<a href="${path}/MainPage.do"> <!-- 메인페이지 링크 --> 
				<img src="${path}/resources/img/logo.png" alt="logo">포용취업넷
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
								<a href="${path}/Notice.do" class="resume">공고글 작성</a>
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
	<!-- 채용공고 시작 -->
	<div class="notice_wrapper">
		<form action="#" method="get">
			<h1 class="notice_title">채용공고</h1>
			<!-- 회사정보 입력페이지 -->
			<table class="notice_content">
				<tr>
					<td class="logo" rowspan="4"><button class="logo_register">로고
							등록</button></td>
					<td class="businessname">&nbsp;&nbsp;&nbsp;&nbsp;회사명</td>
					<td class="businessname_input">사성전자</td>
					<td class="business_idx">&nbsp;사업자번호</td>
					<td class="business_idx_input" name="businessidx">12345678</td>
				</tr>
				<tr>
					<td class="business_boss">&nbsp;&nbsp;&nbsp;&nbsp;대표자명</td>
					<td class="business_boss_input"><input
						class="business_boss_box" name="businessboss" type="text"></td>
					<td class="business_number">&nbsp;총인원</td>
					<td class="business_number_input"><input
						class="business_number_box" name="businesscode" type="text"></td>
				</tr>
				<tr>
					<td class="businesscategory">&nbsp;&nbsp;&nbsp;&nbsp;사업체 직군</td>
					<td class="businesscategory_input" colspan="3"><select
						name="businesscode" class="businesscategory_box">
							<option value="it">IT⦁정보통신</option>
							<option value="menu">제조⦁생산⦁화학업</option>
							<option value="building">건설업</option>
							<option value="media">미디어⦁광고업</option>
							<option value="sell">판매⦁유통업</option>
							<option value="education">교육업</option>
							<option value="medical">의료⦁제약업</option>
							<option value="culture">문화⦁예술⦁디자인업</option>
							<option value="service">서비스업</option>
							<option value="office">사무직</option>
					</select></td>
				</tr>
				<tr>
					<td class="businessaddress">&nbsp;&nbsp;&nbsp;&nbsp;사업장 주소</td>
					<td class="businessaddress_input" colspan="3"><input
						type="text" name="companyaddress" class="businessaddress_box"></td>
				</tr>
			</table>

			<h2 class="hire_information">고용정보</h2>
			<table class="notice_content_2">
				<tr>
					<td class="hirecategory">모집직종</td>
					<td class="hiretype">고용형태</td>
					<td class="requirementcareer">요구경력</td>
					<td class="requirementedu">요구학력</td>
					<td class="salarytype">임금형태</td>
					<td class="salary">임금</td>
				</tr>
				<tr>
					<td class="hirecategory_input"><select name="noticejobcode"
						class="hirecategory_box">
							<option value="it">IT⦁정보통신</option>
							<option value="menu">제조⦁생산⦁화학업</option>
							<option value="building">건설업</option>
							<option value="media">미디어⦁광고업</option>
							<option value="sell">판매⦁유통업</option>
							<option value="education">교육업</option>
							<option value="medical">의료⦁제약업</option>
							<option value="culture">문화⦁예술⦁디자인업</option>
							<option value="service">서비스업</option>
							<option value="office">사무직</option>
					</select></td>
					<td class="hiretype_input"><select name="noticeemp"
						class="hiretype_box">
							<option value="contract">계약직</option>
							<option value="fulltime">상용직</option>
							<option value="parttime">시간제</option>
					</select></td>
					<td class="requirementcareer_input"><input
						class="requirementcareer_box" name="noticecareer" type="text"></td>
					<td class="requirementedu_input"><select name="noticeedu"
						class="requirementedu_box">
							<option value="uni">대졸이상</option>
							<option value="high">고졸</option>
							<option value="middle">중졸이하</option>
					</select></td>
					<td class="salarytype_input"><select name="noticewagemode"
						class="salarytype_box">
							<option value="yearincome">연봉</option>
							<option value="monthincome">월급</option>
							<option value="timeincome">시급</option>
					</select></td>
					<td class="salary_input"><input class="salary_box"
						name="noticewage" type="text"></td>
				</tr>
			</table>

			<h2 class="apply_information">채용공고 정보</h2>
			<table class="notice_content_3" border="1" cellspacing="0">
				<tr>
					<td class="notice_idx">공고글 번호</td>
					<td class="notice_regdate">공고글 등록일</td>
					<td class="notice_period">공고글 기간</td>
				</tr>
				<tr>
					<td class="noticeidx_input" name="noticeidx">20230615-1234</td>
					<td class="noticeregdate_input" name="noticeregdate">2023.06.15</td>
					<td class="noticeperiod_input" name="noticeperiod">2023.06.15
						~ 2023.06.22</td>
				</tr>
			</table>

			<div class="buttons">
				<button class="register" type="submit">등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="cancle" type="button">취소</button>
			</div>
		</form>
	</div>

	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>

</body>
</html>