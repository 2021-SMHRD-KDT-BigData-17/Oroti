<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
    <link rel="stylesheet" href="notice_complete.css">
</head>
<body>
    <header>
        <!-- 헤더 첫 번째 줄 (시작)-->
        <div class="nav1">
            <div class="nav1_left">
                <a href="#"> <!-- 메인페이지 링크 -->
                    <img src="img/logo.png" alt="logo">포용취업넷
                </a>
            </div>

            <div class="nav1_center">
                <input type="text" class="search">
                <button><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
            
            <div class="nav1_right">
                <div class="link_wrap">
                    <!-- 로그인 전에는 "로그인, 회원가입" 버튼만 보이게, 나머지는 숨김 처리 -->
                    <a href="SignIn.html">로그인</a>
                    <a href="SignUp.html">회원가입</a>
                    <!-- 로그인 후에는 "쪽지함, 내정보, 로그아웃" 버튼만 보이게, 나머지는 숨김 처리 -->
                    <a href="#" class="message">쪽지함</a>
                    <a href="#" class="myPage">내정보</a>
                    <a href="#" class="logout">로그아웃</a>
                </div>
            </div>
        </div>
        <!-- 헤더 첫 번째 줄 (끝) -->


        <!-- 헤더 두 번째 줄 (시작) -->
        <div class="nav2">
            <div class="nav2_left">
                <a href="#" class="hire">채용정보</a>
                <a href="#">취업 분포도</a>
                <a href="#">직업·진로</a>
                <a href="#">이력서 작성</a>
            </div>

            <div class="nav2_right">
                <a href="#" class="customer">고객센터</a><!-- 고객센터 페이지 링크 -->
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
                    <td class="logo" rowspan="4"><button class="logo_register">로고 등록</button></td>
                    <td class="businessname">&nbsp;&nbsp;&nbsp;&nbsp;회사명</td>
                    <td class="businessname_input">사성전자</td>
                    <td class="business_idx">&nbsp;사업자번호</td>
                    <td class="business_idx_input" name="businessidx">12345678</td>
                </tr>
                <tr>
                    <td class="business_boss">&nbsp;&nbsp;&nbsp;&nbsp;대표자명</td>
                    <td class="business_boss_input">이제용</td>
                    <td class="business_number">&nbsp;총인원</td>
                    <td class="business_number_input">100</td>
                </tr>
                <tr>
                    <td class="businesscategory">&nbsp;&nbsp;&nbsp;&nbsp;사업체 직군</td>
                    <td class="businesscategory_input" colspan="3">제조⦁생산⦁화학업</td>
                </tr>
                <tr>
                    <td class="businessaddress">&nbsp;&nbsp;&nbsp;&nbsp;사업장 주소</td>
                    <td class="businessaddress_input" colspan="3">순천시 중앙동 100번지</td>
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
                    <td class="hirecategory_input">제조⦁생산⦁화학업</td>
                    <td class="hiretype_input">상용직</td>
                    <td class="requirementcareer_input">경력무관</td>
                    <td class="requirementedu_input">고졸</td>
                    <td class="salarytype_input">연봉</td>
                    <td class="salary_input">3000만원</td>
                </tr>
            </table>
            
            <h2 class="apply_information">채용공고 정보</h2>
            <table class="notice_content_3" border="1" cellspacing="0">    
                <tr>
                    <td class="notice_regdate">공고글 등록일</td>
                    <td class="notice_period">공고글 마감일</td>
                </tr>
                <tr>
                    <td class="noticeregdate_input" name="noticeregdate">2023.06.15</td>
                    <td class="noticeperiod_input" name="noticeperiod">2023.06.22</td>
                </tr>
            </table>

            <div class="buttons">
                <button class="apply" type="submit">즉시지원</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button class="chat" type="button">쪽지보내기</button>
            </div>
        </form>
    </div>
    
    <script src="https://kit.fontawesome.com/d18a01d55c.js" crossorigin="anonymous"></script>
    
</body>
</html>