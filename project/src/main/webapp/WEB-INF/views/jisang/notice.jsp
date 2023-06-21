<%@page import="jisang.poyong.vo.BusinessVO"%>
<%@page import="jisang.poyong.vo.UserVO"%>
<%@page import="javax.xml.crypto.dsig.SignedInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	UserVO user = (UserVO) session.getAttribute("SignIn");
String businessidx = user.getBusinessidx();
String Userid = user.getUserid();
String username = user.getUsername();
String useremail = user.getUseremail();
String userphone = user.getUserphone();

BusinessVO businessAttribute = (BusinessVO) request.getAttribute("business");
if (businessAttribute == null) {
	businessAttribute = (BusinessVO) session.getAttribute("business");
}
String username2 = businessAttribute.getUserid();
String businessidx2 = businessAttribute.getBusinessidx();
String businessname = businessAttribute.getBusinessname();
String businessboss = businessAttribute.getBusinessboss();
String businessmember = businessAttribute.getBusinessmember();
String businesscode = businessAttribute.getBusinesscode();
String companyaddress = businessAttribute.getCompanyaddress();
%>

<%
	java.util.Calendar calendar = java.util.Calendar.getInstance();
int year = calendar.get(java.util.Calendar.YEAR);
int month = calendar.get(java.util.Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
int day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="${path}/resources/css/notice.css">
 <link rel="stylesheet" href="${path}/resources/css/header.css"> 
 
 
 
 <style>
 :root {
    --main-color: #3399ff;
    --line-color: #c9c9c9;
    --line-color2: #a9a9a9;
}

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

header {
    width: 100%;
    /* height: 120px; */
    margin-left: 0;
    /* border: 1px solid #a9a9a9; */
    z-index: 99;
}


/* 헤더 첫 번째 줄 (시작) */
.nav1 {
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #ddd;
}

/* .nav1_left, .nav1_center {
    border-right: 1px solid #c9c9c9;
} */

.nav1_left {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

.nav1_left a {
    display: flex;
    align-items: center;
    margin-left: 100px;
    text-decoration: none;
    font-size: 20px;
    font-weight: 600;
    color: #555;
}

.nav1_left a img {
    width: 30px;
    height: 30px;
    margin-right: 10px;
}

.nav1_center {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: auto;
    margin-right: auto;
}

.nav1_center .search {
    width: 380px;
    height: 38px;
    padding-left: 15px;
    position: relative;
    border-radius: 20px;
    border: 1px solid var(--line-color2);
    outline: none;
    font-size: 14px;
    font-weight: 500;
    color: #000;
}

.nav1_center .search:focus {
    border: 2px solid var(--main-color);
    opacity: 0.6; /* 색상 투명도 조절 */
}

.nav1_center button {
    position: absolute;
    transform: translateX(1200%);
    background-color: transparent;
    border: none;
}

.nav1_center button:hover {
    color: var(--main-color);
}

/* .nav1_center button:active {
    color: var(--main-color);
} */

.nav1_right {
    flex: 1;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}

.nav1_right .link_wrap {
    margin-right: 100px;
}

.nav1_right a {
    margin-left: 20px;
    text-decoration: none;
    color: #333;
    font-weight: 600;
}

.nav1_right a:hover {
    color: var(--main-color);
}
/* 헤더 첫 번째 줄 (끝) */


/* 헤더 두 번째 줄 (시작) */
.nav2 {
    width: 100%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-shadow: 0 3px 3px var(--line-color);
    opacity: 0.8;
}

.nav2_left {
    margin-left: 100px;
}

.nav2_left a {
    margin-right: 30px;
    text-decoration: none;
    color: #333;
    font-weight: 600;
    cursor: pointer;
}

.nav2_left a:hover {
    color: var(--main-color);
}

.nav2_left .hire {
    color: var(--main-color);
}

.nav2_right {
    margin-right: 100px;
}

.nav2_right .customer {
    text-decoration: none;
    font-size: 14px;
    color: #333;
}

.nav2_right .customer:hover {
    color: var(--main-color);
}
/* 헤더 두 번째 줄 (끝) */

/* 채용공고 디자인 */
.notice_title{
    text-align: center;
    letter-spacing: 10px;
    margin: 40px 0;
}

.notice_content{
    width: 850px;
    height: 250px;
    margin: auto;
    border: #c9c9c9;
    border-top: solid 2px #c9c9c9;
    border-bottom: solid 2px #c9c9c9;
    border-collapse: collapse;
}

.notice_content tr{
    border-bottom: solid 1px #c9c9c9;
}

.businessname{
    width: 150px;
    text-align: left;
    font-weight: 600;
    border-right: none;
    height: 55px;
}

.business_name_input{
    border-left: none;
    border-right: none;
    height: 55px;
}

.business_idx{
    border-left: none;
    border-right: none;
    font-weight: 600;
    height: 55px;
    text-align: left;
}

.business_idx_input{
    border-left: none;
    height: 55px;
}

.business_boss{
    font-weight: 600;
    border-right: none;
    text-align: left;
}

.business_boss_input{
    border-left: none;
    height: 55px;
}

.business_boss_box{
    height: 35px;
    width: 125px;
}

.business_number{
    border-right: none;
    font-weight: 600;
    height: 55px;
    text-align: left;
}

.business_number_input{
    border-left: none;
    height: 55px;
}

.business_number_box{
    height: 35px;
    width: 125px;
}

.businesscategory{
    border-right: none;
    font-weight: 600;
    height: 55px;
    text-align: left;
}

.businesscategory_input{
    border-left: none;
    height: 55px;
}

.businesscategory_box{
    height: 35px;
    width: 250px;
}

.businessaddress{
    border-right: none;
    font-weight: 600;
    height: 55px;
    text-align: left;
}

.businessaddress_input{
    border-left: none;
    height: 55px;
}

.businessaddress_box{
    height: 35px;
    width: 250px;
}

.edit_bt{
    height: 35px;
    width: 55px;
    background-color: #3399ff;
    color: white;
    font-size: 18px;
    font-weight: 600;
    border-radius: 3px;
    border: none;
    cursor: pointer;
    margin-left: 1130px;
    margin-top: 10px;
}

.hire_information{
    font-size: 22px;
    font-weight: 600;
    text-align: left;
    margin-top: 60px;
    margin-bottom: 20px;
}

.notice_content_2{
    margin: auto;
    margin-top: 10px;
    width: 850px;
    height: 125px;
    border-bottom: solid 2px #c9c9c9;
    border-top: solid 2px #c9c9c9;
    border-right: none;
    border-left: none;
    border-collapse: collapse;
}

/*.notice_content_2 td{
    border: solid 1px #c9c9c9;
}*/

.hirecategory{
    width: 190px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    text-align: center;
}

.hirecategory_input{
    width: 190px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    text-align: center;
    border-bottom: solid 1px #c9c9c9;
    border-top: solid 1px #c9c9c9;
}

.hirecategory_box{
    height: 35px;
    width: 150px;
}

.hiretype{
    width: 132px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    text-align: center;
}

.hiretype_input{
    width: 132px;
    height: 55px;
    border-bottom: solid 1px #c9c9c9;
    text-align: center;
    border-top: solid 1px #c9c9c9;

}

.hiretype_box{
    height: 35px;
    width: 100px;
}

.salarytype{
    width: 132px;
    height: 55px;
    text-align: center;
}

.salarytype_input{
    width: 132px;
    height: 55px;
    border-bottom: solid 1px #c9c9c9;
    text-align: center;
    border-top: solid 1px #c9c9c9;

}

.salarytype_box{
    width: 100px;
    height: 35px;
}

.salary{
    width: 132px;
    height: 55px;
    border-left: solid 1px #c9c9c9;
    text-align: center;
}

.salary_input{
    width: 132px;
    height: 55px;
    border-left: solid 1px #c9c9c9;
    border-bottom: solid 1px #c9c9c9;
    text-align: center;
    border-top: solid 1px #c9c9c9;

}

.salary_box{
    width: 100px;
    height: 35px;
}

.requirementcareer{
    width: 132px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    text-align: center;
}

.requirementcareer_input{
    width: 132px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    border-left: solid 1px #c9c9c9;
    border-bottom: solid 1px #c9c9c9;
    text-align: center;
    border-top: solid 1px #c9c9c9;

}

.requirementcareer_box{
    width: 100px;
    height: 35px;
}

.requirementedu{
    width: 132px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    text-align: center;
}

.requirementedu_input{
    width: 132px;
    height: 55px;
    border-right: solid 1px #c9c9c9;
    border-bottom: solid 1px #c9c9c9;
    text-align: center;
    border-top: solid 1px #c9c9c9;
}

.requirementedu_box{
    width: 100px;
    height: 35px;
}

.apply_information{
    font-size: 22px;
    font-weight: 600;
    text-align: left;
    margin-top: 60px;
    margin-bottom: 20px;
}

.notice_content_3{
    margin: auto;
    margin-top: 10px;
    width: 850px;
    height: 125px;
    border-bottom: solid 2px #c9c9c9;
    border-top: solid 2px #c9c9c9;
    border-right: none;
    border-left: none;
    border-collapse: collapse;
}

.notice_content_3 tr {
    border-bottom: 1px solid #c9c9c9;
}

.notice_content_3 tr td:nth-child(1) {
    border-right: 1px solid #c9c9c9;
}

.notice_regdate{
    width: 425px;
    height: 55px;
    text-align: center;
}

.noticeregdate_input{
    width: 425px;
    height: 55px;
    text-align: center;
}

.notice_period{
    width: 425px;
    height: 55px;
    text-align: center;
    border-right: none;
}

.noticeperiod_input{
    width: 425px;
    height: 55px;
    text-align: center;
    border-right: none;
}

.noticeperiod_box{
    height: 40px;
    width: 200px;
}

/* 버튼디자인 */
.buttons{
    text-align: center;
    margin-top: 50px;
    margin-bottom: 60px;
}

.register{
    width: 100px;
    height: 40px;
    color: white;
    font-weight: 500;
    font-size: 20px;
    letter-spacing: 5px;
    background-color: #3399ff;
    cursor: pointer;
    border: none;
}

.cancle{
    width: 100px;
    height: 40px;
    background-color: white;
    color: #777;
    border: solid 1px #a9a9a9;
    letter-spacing: 5px;
    font-weight: 500;
    font-size: 20px;
    cursor: pointer;
}
 </style>
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
	<!-- 채용공고 시작 -->
	<div class="notice_wrapper">
		<form action="${path}/InsertNotice.do" method="get">
			<input name="userid" type="hidden" value="<%=Userid%>"> <input
				name="companyname" type="hidden" value="<%=businessname%>">
			<input name="companyaddress" type="hidden"
				value="<%=companyaddress%>"> <input name="businessboss"
				type="hidden" value="<%=businessboss%>"> <input
				name="businessmember" type="hidden" value="<%=businessmember%>">
			<input name="businesscode" type="hidden" value="<%=businesscode%>">
			<h1 class="notice_title">채용공고</h1>
			<!-- 회사정보 입력페이지 -->
			<table class="notice_content">
				<tr>
					<td class="businessname">&nbsp;&nbsp;&nbsp;&nbsp;회사명</td>
					<td class="businessname_input"><%=businessname%></td>
					<td class="business_idx">&nbsp;사업자번호</td>
					<td class="business_idx_input"><%=businessidx%></td>
				</tr>
				<tr>
					<td class="business_boss">&nbsp;&nbsp;&nbsp;&nbsp;대표자명</td>
					<td class="business_boss_input"><%=businessboss%></td>
					<td class="business_number">&nbsp;총인원</td>
					<td class="business_number_input"><%=businessmember%></td>
				</tr>
				<tr>
					<td class="businesscategory">&nbsp;&nbsp;&nbsp;&nbsp;사업체 직군</td>
					<td class="businesscategory_input" colspan="3">
						<%
							if (businesscode.equals("1")) {
						%> IT⦁정보통신 <%
							} else if (businesscode.equals("2")) {
						%> 제조⦁생산⦁화학업 <%
							} else if (businesscode.equals("3")) {
						%> 건설업 <%
							} else if (businesscode.equals("4")) {
						%> 미디어⦁광고업 <%
							} else if (businesscode.equals("5")) {
						%> 판매⦁유통업 <%
							} else if (businesscode.equals("6")) {
						%> 교육업 <%
							} else if (businesscode.equals("7")) {
						%> 의료⦁제약업 <%
							} else if (businesscode.equals("8")) {
						%> 문화⦁예술⦁디자인업 <%
							} else if (businesscode.equals("9")) {
						%> 서비스업 <%
							} else if (businesscode.equals("10")) {
						%> 사무직 <%
							} else {
						%> 기타 <%
							}
						%>
					</td>
				</tr>

				<tr>
					<td class="businessaddress">&nbsp;&nbsp;&nbsp;&nbsp;사업장 주소</td>
					<td class="businessaddress_input" colspan="3"><%=businessidx%></td>
				</tr>
			</table>

			<table class="notice_content_2">
				<caption class="hire_information">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고용정보</caption>
				<tr>
					<td class="hirecategory">모집직종</td>
					<td class="hiretype">고용형태</td>
					<td class="requirementcareer">요구경력</td>
					<td class="requirementedu">요구학력</td>
					<td class="salarytype">임금형태</td>
					<td class="salary">임금(만원)</td>
				</tr>
				<tr>
					<td class="hirecategory_input"><select name="noticejobcode"
						class="hirecategory_box">
							<option value="1">IT⦁정보통신</option>
							<option value="2">제조⦁생산⦁화학업</option>
							<option value="3">건설업</option>
							<option value="4">미디어⦁광고업</option>
							<option value="5">판매⦁유통업</option>
							<option value="6">교육업</option>
							<option value="7">의료⦁제약업</option>
							<option value="8">문화⦁예술⦁디자인업</option>
							<option value="9">서비스업</option>
							<option value="10">사무직</option>
					</select></td>
					<td class="hiretype_input"><select name="noticeemp"
						class="hiretype_box">
							<option value="계약직">계약직</option>
							<option value="상용직">상용직</option>
							<option value="시간제">시간제</option>
					</select></td>
					<td class="requirementcareer_input"><input
						class="requirementcareer_box" name="noticejoinmode" type="text"></td>
					<td class="requirementedu_input"><select name="noticeedu"
						class="requirementedu_box">
							<option value="대졸이상">대졸이상</option>
							<option value="고졸">고졸</option>
							<option value="중졸이하">중졸이하</option>
					</select></td>
					<td class="salarytype_input"><select name="noticewagemode"
						class="salarytype_box">
							<option value="연봉">연봉</option>
							<option value="월급">월급</option>
							<option value="시급">시급</option>
					</select></td>
					<td class="salary_input"><input class="salary_box"
						name="noticewage" type="text"></td>
				</tr>
			</table>

			<table class="notice_content_3">
				<caption class="apply_information">&nbsp;&nbsp;&nbsp;채용공고 정보</caption>
				<tr>
					<td class="notice_regdate">공고글 등록일</td>
					<td class="notice_period">공고글 마감일</td>
				</tr>
				<tr>
					<td class="noticeperiod_input"><input name="noticeregdate"
						type="hidden" value="<%=year%>-<%=month%>-<%=day%>"> <%=year%>-<%=month%>-<%=day%></td>
					<td class="noticeperiod_input"><input class="noticeperiod_box"
						type="date" name="noticeperiod" value=""></td>
				</tr>
			</table>

			<div class="buttons">
				<button class="register" type="submit">등록</button>
				&nbsp;&nbsp;&nbsp;&nbsp; <a href="${path}/MainPage.do"><button
						class="cancle" type="button">취소</button></a>
			</div>
		</form>
	</div>

	<script src="https://kit.fontawesome.com/d18a01d55c.js"
		crossorigin="anonymous"></script>

</body>
</html>
