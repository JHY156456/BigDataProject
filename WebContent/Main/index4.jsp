<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.sid}">
	<c:set var="dog" value="noLogin" />
</c:if>
<c:if test="${not empty sessionScope.sid}">
	<c:set var="dog" value="${sid}" />
</c:if>
<%
	String sessionId = (String) pageContext.getAttribute("dog");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, user-scalable=yes, target-densitydpi=device-dpi">
<title>3H Board</title>



<!-- 지도에서가져온거 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=iw7zHumy_uqGEM4wvpuh"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.2/bootstrap3-typeahead.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script type="text/javascript">
   
   $(function(){
      
      $('#searchStation').keyup(function(e){
         
         if(e.keyCode == 13){
         
            $('#insertKeyword').click();
            
         }
         
         if($('#searchStation').val() != ""){
            document.getElementById('searchResult').style.display = 'block';
            
             $.ajax({
                    url:"${pageContext.request.contextPath}/scont?command=searchStation",
                    type:'GET',
                    data: {keyword : $('#searchStation').val()},
                    success:function(data){
                       document.getElementById("searchResult").innerHTML = data;
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        self.close();
                    }
                });
         }
         
         else{
            document.getElementById('searchResult').style.display = 'none';
            
         }
         
      });

   });
   
   $(function(){
      
      $('#insertKeyword').on('click',function(){

          $.ajax({
                 url:"${pageContext.request.contextPath}/scont?command=insertKeyword",
                 type:'GET',
                 data: {keyword : $('#searchStation').val()},
                 success:function(data){
                 },
                 error:function(jqXHR, textStatus, errorThrown){
                     self.close();
                 }
             });
          
          $.ajax({
                 url:"${pageContext.request.contextPath}/scont?command=zoomStation",
                 type:'GET',
                 data: {keyword : $('#searchStation').val()},
                 success:function(data){
                    zoomStation(data);
                 },
                 error:function(jqXHR, textStatus, errorThrown){
                     self.close();
                 }
             });
      });
   });

   </script>

<script type="text/javascript">
   
   function ajaxReq(){
      var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
             //innerHTML - js에서 html tag를 화면에 출력할 때 사용되는 속성
             //주의사항 : div와 p tag에 반영되는 속성
             //innerText는 tag반영 안됨
          
             drawMap(this.responseText);
             }
          }
        
        xhttp.open("GET", "${pageContext.request.contextPath}/scont?command=stationMap", true);
        xhttp.send();
   }
   
   function autoComplete(obj){
      document.getElementById('searchStation').value = obj;
      document.getElementById('searchResult').style.display = 'none';
      document.getElementById('searchStation').focus();
   }
   
   </script>
<!-- 아래는 이지스퍼블리싱에서 가져온 css,js -->
<link rel="canonical" href="http://www.easyspub.co.kr/Main" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.11.2.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/layout_sub.css" />


<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery-ui-1.11.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery.cookie-1.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/common_func.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery.navgoco-0.2.1.js"></script>
<!--[if lt IE 9]>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ie8.css" />
    <script src="${pageContext.request.contextPath}/easy_js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/easy_js/respond.min.js"></script>
<![endif]-->

<!-- 모바일 : 메인 페이지 슬라이드 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery.swiper-2.1.min.js"></script>
<style>
<
style>input[type="password"] {
	height: 24px;
	line-height: 24px;
	padding: 0 10px
}

input[type="checkbox"] {
	vertical-align: middle
}

textarea {
	border: 1px #dfdfdf solid;
}

/*라디오버튼, 체크박스 공통*/
input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label span {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: -2px 5px 0 0;
	vertical-align: middle;
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		left top no-repeat;
	cursor: pointer;
}

input[type="checkbox"]:checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		-14px top no-repeat;
}

input[type="checkbox"]::checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_check_sheet.png)
		-14px top no-repeat;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label>span {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: -2px 5px 0 0;
	vertical-align: middle;
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		left top no-repeat;
	cursor: pointer;
	padding: 0;
}

a {
	text-decoration: none;
	cursor: pointer;
	font-weight: bold;
	color: #222;
}

input[type="radio"]:checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		-14px top no-repeat;
}

input[type="radio"]::checked+label span {
	background:
		url(${pageContext.request.contextPath}/images/check_radio_sheet.png)
		-14px top no-repeat;
}

.login_box {
	border: 1px solid #72ebc8;
	width: 230px;
	height: 230px;
	background-color: #fff;
	position: absolute;
	top: 200px;
	left: 30px;
	padding: 20px;
	box-sizing: content-box;
	float: left;
	padding: 20px;
}

.login_box .inputlogin {
	width: 100%;
	height: 45px;
	line-height: 45px;
	border-bottom: solid 1px #ccc;
	background: #fff;
	font-size: 14px;
	color: #ccc;
	text-indent: 10px;
}

.login_box input[type="password"] {
	padding: 0
}

.login_box .autologin {
	font-size: 12px;
	color: #222;
	display: inline-block;
	margin-top: 10px;
	margin-right: 5px;
	letter-spacing: -1px
}

.login_box .idpw_srch {
	font-size: 12px;
	color: #222;
	padding-left: 5px;
	margin-top: 10px;
	font-weight: normal;
	letter-spacing: -1px
}

.login_box .btn_login {
	width: 100%;
	background-color: #72ebc8;
	height: 40px;
	color: #222;
	font-size: 13px;
	font-weight: bold;
	margin: 10px 0
}

.login_box .btn_login:after {
	display: block;
	content: '';
	clear: both;
}

.login_box .nonmember {
	font-size: 12px;
	color: #222;
	font-weight: bold;
	background:
		url(${pageContext.request.contextPath}/images/ic_nomember.jpg) left
		center no-repeat;
	display: inline-block;
	line-height: 23px;
	padding: 0 10px 0 25px;
	margin-right: 8px;
	border-right: #dfdfdf 1px solid;
	letter-spacing: -0.02em
}

.login_box .foreigner {
	font-size: 12px;
	color: #222;
	font-weight: bold;
	background:
		url(${pageContext.request.contextPath}/images/ic_foreigner.jpg) left
		center no-repeat;
	line-height: 23px;
	padding-left: 25px;
	letter-spacing: -0.02em
}

.login_box .btn_join {
	display: none
}

.login_box p {
	display: none
}

.login_box .close {
	display: none
}

strong, dl, dt, dd, ol, ul, li, fieldset {
	margin: 0;
	padding: 0;
	font-size: 100%;
}

fieldset {
	border: none
}

img {
	border: 0;
	vertical-align: middle;
}
</style>
<style>
#imaginary_container {
	margin-top: 5%; /* Don't copy this */
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}
</style>
</head>

<body onLoad="ajaxReq()">
	<div class="wrap" id="pub">
		<!-- Gnb 영역 : s -->
		<div class="gnb_wrap">
			<div id="gnb">
				<div class="container">
					<h1 style ="top:59px;">
						<a href="${pageContext.request.contextPath}/Main/main.jsp"><img
							src="${pageContext.request.contextPath}/images/logo_pub.png"
							alt="이지스퍼블리싱"></a>
					</h1>
					<!-- web 화면에서 menu :s -->
					<div class="menu_area">
						<a href="#" class="btn_close_menu ver_mobile"><img
							src="${pageContext.request.contextPath}/images/btn_close_gnb.png"
							alt="메뉴 닫기" style="width: 30px;"></a>
						<ul class="depth01">
							<li class="current"><a
								href="${pageContext.request.contextPath}/Main/main.jsp"
								id="pub001A02이지스퍼블리싱" class="btnMainLink"><img
									src="${pageContext.request.contextPath}/images/logo_pub.png"
									alt="이지스 퍼블리싱"></a>
								<div class="depth02_area">
									<ul class="depth02">
										<li><a
											href="${pageContext.request.contextPath}/Main/3hboard.jsp">사업소개</a></li>

										<li><a
											href="${pageContext.request.contextPath}/Main/index4.jsp">대여소
												현황</a></li>
										<li><a
											href="${pageContext.request.contextPath}/Main/notice.jsp">공지사항</a></li>
										<li><a
											href="${pageContext.request.contextPath}/cont?command=community">커뮤니티</a></li>
										<li><a
											href="${pageContext.request.contextPath}/cont?command=citizen">불편해요</a></li>

										<!-- <li><a href="${pageContext.request.contextPath}/BoardList/Citizen.jsp">불편해요</a></li>
										 -->
										<li><a
											href="${pageContext.request.contextPath}/Main/safeRule.jsp">안전수칙</a></li>


									</ul>
								</div></li>
							<li><a
								href="${pageContext.request.contextPath}/Main/main.jsp"
								id="edu002A03이지스에듀" class="btnMainLink"><img
									src="${pageContext.request.contextPath}/images/logo_pub.png"
									alt="이지스 에듀"></a>
								<div class="depth02_area none">
									<ul class="depth02">
										<li><a href="#">회사소개</a>
											<div>
												<ul class="depth03">
													<li><a href="/11_Menu/CompanyInfo/PUB">이지스퍼블리싱(주)
															소개</a></li>
													<li><a href="/11_Menu/EngCompanyInfo/PUB">About
															EasysPublishing</a></li>
													<li><a href="/11_Menu/BrandInfo2/PUB">이지스에듀 소개</a></li>
													<li><a href="/11_Menu/BookDown/PUB">도서 목록 다운로드</a></li>
													<li><a href="/12_Menu/BoardList/C100/PUB">뉴스와 홍보
															자료</a></li>
													<li><a href="/12_Menu/BoardList/C200/PUB">공지사항/이벤트</a></li>
													<li><a href="/11_Menu/Location/PUB">찾아오시는 길</a></li>
												</ul>
											</div></li>
										<li><a href="#">도서</a>
											<div>
												<ul class="depth03">
													<li><a href="/20_Menu/BookList/PUB">전체 보기</a></li>
													<li><a href="#">분야별 보기</a>
														<ul class="depth04">
															<li><a href="/20_Menu/BookList/A001/PUB">초등 수학</a></li>
															<li><a href="/20_Menu/BookList/A002/PUB">초등 영어</a></li>
															<li><a href="/20_Menu/BookList/A007/PUB">초등 한자</a></li>
															<li><a href="/20_Menu/BookList/A003/PUB">중등 수학</a></li>
															<li><a href="/20_Menu/BookList/A008/PUB">중등 영어</a></li>
															<li><a href="/20_Menu/BookList/A004/PUB">자녀교육,
																	기타</a></li>
														</ul></li>
													<li><a href="#">시리즈 보기</a>
														<ul class="depth04">
															<li><a href="/20_Menu/BookList/B003/PUB">바빠 연산법</a></li>
															<li><a href="/20_Menu/BookList/B011/PUB">바빠 중학
																	수학</a></li>
															<li><a href="/20_Menu/BookList/B004/PUB">바빠 영어</a></li>
															<li><a href="/20_Menu/BookList/B012/PUB">바빠 급수
																	한자</a></li>
															<li><a href="/20_Menu/BookList/B005/PUB">우리집은
																	놀이터</a></li>
															<li><a href="/20_Menu/BookList/B009/PUB">에듀_기타</a></li>
															<li><a href="/20_Menu/BookList/B013/PUB">나 혼자
																	푼다!</a></li>
														</ul></li>
													<li><a href="/20_Menu/BookList/C000/PUB">전자책 보기</a></li>
													<li><a href="#" id="pub001A02이지스퍼블리싱"
														class="btBookLink">이지스퍼블리싱 도서 보기</a></li>
												</ul>
											</div></li>
										<li><a href="/30_Menu/DataList/PUB">자료실</a></li>


										<li class="last"><a
											href="${pageContext.request.contextPath}/BoardList/citizenOpinionList.jsp">불편해요</a></li>


										<li class="last short_cut_cafe"><a
											href="http://blog.naver.com/easyspub" target="_blank">바빠
												아지트</a></li>
										<li class="last short_cut_cafe"><a
											href="http://cafe.naver.com/easyispub" target="_blank">네이버
												카페</a></li>
									</ul>
								</div></li>
						</ul>
					</div>
					<!-- web 화면에서 menu : e -->

					<!-- web 화면에서 로그인 : s -->
					<div class="form_area">
						<p class="ver_web">
							<c:if test="${empty sessionScope.sid}">
								<input type="button" name="WebLogin" value="로그인" title="로그인"
									class="btnTopLogin" />
							</c:if>
							<c:if test="${not empty sessionScope.sid}">
								<span
									style="line-height: 1em; margin: 0 8px; color: #cdcdcd; background-color: transparent; font-weight: 500;">${sid}님
									환영합니다.</span>
								<a href="${pageContext.request.contextPath}/cont?command=logout">
									<span
									style="line-height: 1em; margin: 0 8px; color: #cdcdcd; background-color: transparent; font-weight: 500;">로그아웃</span>
								</a>
							</c:if>
							| <input type="button" name="WebJoin" value="회원가입" title="회원가입"
								class="btnTopJoin" />
						</p>
						<p class="search_area ver_web">
							<input type="text" id="TotalKeyword1" name="TotalKeyword1"
								class="inputbox_none btnTotalKeyword" value="킥보드, 지역 등 검색"
								onfocus="this.value='';"
								onblur="if(this.value=='') this.value='킥보드, 지역 등 검색';" /> <a
								href="#TOTALSEARCH" class="btnTotalSearch1">도서검색</a>
						</p>
					</div>

					<p class="gnb_menu ver_mobile">
						<a href="#Menu" class="btn_open_menu"><img
							src="${pageContext.request.contextPath}/images/mobile/ico_menu.png"
							alt="메뉴열기"></a> <a href="#Search" class="btn_search"><img
							src="${pageContext.request.contextPath}/images/mobile/ico_search.png"
							alt="도서검색"></a>
					</p>
					<!-- web 화면에서 로그인 : e -->
				</div>
			</div>
		</div>
		<!-- gnb 영역 : e -->
		<!-- 컨텐츠 영역 : s -->
		<div class="gnb_wrap_search none">
			<div class="search_area ver_mobile">
				<div>
					<input type="text" id="TotalKeyword2" name="TotalKeyword2"
						class="inputbox_none btnTotalKeyword"
						title="출판사 &quot;이지스퍼블리싱&quot;의 책들만 검색이 가능합니다."
						value="킥보드, 지역 등 검색" onfocus="this.value='';"
						onblur="if(this.value=='') this.value='킥보드, 지역 등 검색';" />
				</div>
				<a href="#TOTALSEARCH" class="btnTotalSearch2 btn btnBlack btnS">검색</a>
			</div>
		</div>
		<!-- 컨텐츠 영역 : e -->

		<form method="post" id="frmTotalSearch" name="frmTotalSearch"
			action="/71_Menu/SearchList/PUB" onsubmit="return true;">
			<input type="hidden" id="TotalPage" name="TotalPage" value="1" /> <input
				type="hidden" id="TotalPageType" name="TotalPageType" value="" /> <input
				type="hidden" id="TotalKeyword" name="TotalKeyword" value="" />
		</form>


		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$(".depth02_area>ul").navgoco({
									accordion : true
								});

								$('.btnTopLogin')
										.click(
												function(e) {
													window.location = "${pageContext.request.contextPath}/RegisterStep/loginForm.jsp";
												});
								$('.btnTopJoin')
										.click(
												function(e) {
													window.location = "${pageContext.request.contextPath}/RegisterStep/MemberRegister01.jsp";
												});

								$('.btn_search').click(function(e) {
									$('.gnb_wrap_search').toggle();
									$('.gnb_wrap_search').removeClass('none');
								});

								$('.btnTotalSearch1')
										.click(
												function(e) {
													if ($('#TotalKeyword1')
															.val() == ""
															|| $(
																	'#TotalKeyword1')
																	.val() == "도서명, 저자 등 검색") {
														alert("검색어를 입력하세요.");
														$('#TotalKeyword1')
																.focus();
														return;
													} else {
														if ($('#TotalKeyword1')
																.val() == "도서명, 저자 등 검색")
															$('#TotalKeyword1')
																	.val("");

														$('#TotalPage').val(1);
														$('#TotalPageType')
																.val("");
														$('#TotalKeyword')
																.val(
																		$(
																				'#TotalKeyword1')
																				.val());

														var keyWord = document
																.getElementById('TotalKeyword1').value;

														var url = '${pageContext.request.contextPath}/cont?command=search&keyWord='
																+ encodeURIComponent(keyWord)+'&search_id=<%=sessionId%>';
														
														alert(url);
														$('#frmTotalSearch')
																.attr('action',
																		url)
																.submit();
													}
												});
								$('.btnTotalSearch2')
										.click(
												function(e) {
													if ($('#TotalKeyword2')
															.val() == ""
															|| $(
																	'#TotalKeyword2')
																	.val() == "도서명, 저자 등 검색") {
														alert("검색어를 입력하세요.");
														$('#TotalKeyword2')
																.focus();
														return;
													} else {
														if ($('#TotalKeyword2')
																.val() == "도서명, 저자 등 검색")
															$('#TotalKeyword2')
																	.val("");

														$('#TotalPage').val(1);
														$('#TotalPageType')
																.val("");
														$('#TotalKeyword')
																.val(
																		$(
																				'#TotalKeyword2')
																				.val());
														$('#frmTotalSearch')
																.attr('action',
																		'/71_Menu/SearchList/PUB')
																.submit();
													}
												});
								$('.btnTotalKeyword')
										.keyup(
												function(e) {
													if (e.keyCode == 13) {
														if ($(this).val() == "") {
															alert("검색어를 입력하세요.");
															$(this).focus();
															return false;
														} else {
															if ($(this).val() == "도서명, 저자 등 검색")
																$(this).val("");

															$('#TotalPage')
																	.val(1);
															$('#TotalPageType')
																	.val("");
															$('#TotalKeyword')
																	.val(
																			$(
																					this)
																					.val());
															var keyWord = document
																	.getElementById('TotalKeyword1').value;

															var url = '${pageContext.request.contextPath}/cont?command=search&keyWord='
																	+ encodeURIComponent(keyWord)+'&search_id=<%=sessionId%>';
															$('#frmTotalSearch')
																	.attr(
																			'action',
																			url)
																	.submit();
														}
													}
												});

								$('.btnMainLink').click(function(e) {
									var sBrandCode = $(this).attr('id');
									var sBrandUrl = sBrandCode.substring(0, 3);
									$.cookie('BrandCode', sBrandCode, {
										expires : 365,
										path : '/'
									});

									window.location = "/Main/" + sBrandUrl;
								});
								$('.btBookLink')
										.click(
												function(e) {
													var sBrandCode = $(this)
															.attr('id');
													var sBrandUrl = sBrandCode
															.substring(0, 3);
													$.cookie('BrandCode',
															sBrandCode, {
																expires : 365,
																path : '/'
															});

													window.location = "/20_Menu/BookList/"
															+ sBrandUrl;
												});
							});
		</script>
		<!-- Gnb 영역 : e -->

		<!-- 컨텐츠 영역 : s -->

		<div class="contents_wrap" id="main_wrap">
		<div class="menu_loacation">
				<div class="container">
					<a href="${pageContext.request.contextPath}/Main/main.jsp" class="home" title="메인페이지로 이동"></a> 
					<span class="depth pointer">대여소 현황</span>
				</div>
			</div>
			<!--  
			<div class="login_box">
				<form name="loginForm" action="/j_spring_security_check"
					method="POST">
					<fieldset>
						<legend>로그인</legend>
						<a href="" class="close"></a>
						<p>로그인 후 자전거 대여하실 수 있습니다.</p>
						<div>
							<input class="inputlogin" onkeypress="" name="j_username"
								id="j_username" value="" size="18" maxlength="" tabindex=""
								placeholder="아이디">
						</div>
						<div>
							<input class="inputlogin" onkeypress="" name="j_password"
								id="j_password" value="" type="password" size="" maxlength=""
								tabindex="" placeholder="비밀번호">
						</div>
						<div class="autologin">
							<input type="checkbox" name="loginchk" id="logchk" title="자동로그인"
								value="true"><label for="logchk"><span></span>자동로그인</label>
						</div>
						<a href="/memberIdFind.do" class="idpw_srch">아이디</a>/<a
							href="memberPwFind.do" class="idpw_srch">비밀번호찾기</a>
						<div class="loginbtn">
							<input class="btn_login" type="submit" title="로그인" alt="로그인"
								tabindex="" value="로그인" id="loginBtn"> <input
								class="btn_join" type="submit" title="회원가입" alt="회원가입"
								tabindex="" value="회원가입" id="joinBtn">
						</div>
						<a href="https://www.bikeseoul.com:447/main.do?lang=ko"
							class="nonmember">비회원<img src="images/arrow_login.jpg" alt=""></a>
						<a href="https://www.bikeseoul.com:447/main.do?lang=en"
							class="foreigner">foreigner<img src="images/arrow_login.jpg"
							alt=""></a> <input type="hidden" id="ostype" name="appOsType"
							value="web"> <input type="hidden" id="usrDeviceId"
							name="usrDeviceId">
					</fieldset>
				</form>
			</div>
			-->
			<!-- slider book list : s -->
			<div class="container">
				<div class="row" style="margin: 0 auto">
					<div class="col-sm-6 col-sm-offset-3"
						style="width: 100%; height: 100%; margin: auto; margin-bottom: 10%;">
						<div id="imaginary_container">
							<div class="input-group stylish-input-group">
								<input type="text" class="form-control" placeholder="Search"
									id="searchStation"> <span class="input-group-addon">
									<button type="submit" id="insertKeyword">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
						<div class="col-sm-6"
							style="width: 100%; height: 30px; border: 1px solid black; text-align: center;">
							<img src="${pageContext.request.contextPath}/images/gray_64.png"
								style="width: 30px; height: 30px;"> 0대 <img
								src="${pageContext.request.contextPath}/images/red_64.png"
								style="width: 30px; height: 30px;"> 1~3대 <img
								src="${pageContext.request.contextPath}/images/yellow_64.png"
								style="width: 30px; height: 30px;"> 4~6대 <img
								src="${pageContext.request.contextPath}/images/orange_64.png"
								style="width: 30px; height: 30px;"> 7~9대 <img
								src="${pageContext.request.contextPath}/images/blue_64.png"
								style="width: 30px; height: 30px;"> 10대 이상
						</div>
						<div id="searchResult"
							style="width: 95%; background-color: white; border: 1px solid black; position: absolute; display: none; z-index: 99"></div>
						<p></p>
						<p></p>
						<div id="map"
							style="width: 100%; height: 600px; margin: auto; position: relative; z-index: 1;"></div>
					</div>
				</div>

			</div>
			<!-- slider book list : e -->

			<!-- 바로가기 메뉴 : s -->
			<div id="short_cut_cnt">
				<div class="container">
					<ul>
						<li><a href="/72_Menu/BoardWrite/PUB"><img
								src="${pageContext.request.contextPath}/images/ico_sample.png"
								alt=""><span><em>안전 유의 사항</em> <b> 안전모 / 보호구 대여
								</b></span></a></li>
						<li><a href="http://cafe.naver.com/doitstudyroom"
							target="_blank"><img
								src="${pageContext.request.contextPath}/images/ico_cafe.png"
								alt=""><span><em>킥보드 카페</em> <b>DO IT!
										Kickboard</b></span></a></li>
					</ul>
				</div>
			</div>
			<!-- 바로가기 메뉴 : e -->

		

		</div>
		<!-- 컨텐츠 영역 : e -->

		<!-- footer : s -->
		<div id="footer">
			<div class="footer_menu">
				<div class="container">
					<ul>
						<li><a href="/11_Menu/Location/PUB">찾아오시는 길</a></li>
						<li><a href="/73_Menu/Privacy/PUB">개인정보취급방침</a></li>
						<li><a href="/73_Menu/Agreement/PUB">이용약관</a></li>
					</ul>
					<div class="short_cut_ftr">
						<a href="/73_Menu/WriterApply/PUB">가맹점 신청</a>
						</li> <a
							href="https://docs.google.com/forms/d/e/1FAIpQLSc5ybZjSZqnV4ioXjSaIwKLjByN5mS01qByW33J3gtYdI3avA/viewform">수리문의</a>
						<a href="/72_Menu/BoardWrite/PUB">킥보드샘플 요청</a>
						</li>
					</div>
				</div>
			</div>
		</div>

		<div class="copyrights_area">
			<div class="container" style="display: inline;">

				<div class="address"
					style="display: inline-block; margin-top: 20px; margin-left: 350px">
					<span>서울특별시 강남구 언주로 508 10~17층(역삼동, 서울상록빌딩)</span> <br
						class="none_br"> <span>TEL (02)325-1722</span> <span>FAX
						(02)326-1723</span><br> <span>사업자등록번호 105-87-44487</span> <span>대표자
						: 신혜영 / <br class="none_br">Email : <a
						href="mailto:easy@easyspub.co.kr">easy@3hboard.co.kr</a>
					</span><br> <span>Copyright(c)2018 3H보드㈜ 3H Board Co., Ltd.
						All Rights Reserved</span>
				</div>
				<img src="/WebProject/images/logo_footer.png" alt="logo">
			</div>
		</div>
	</div>
		<a class = "btnGoTop" title="goTop" style="display:block;">
			<img src="${pageContext.request.contextPath}/images/btn_top.png">
		</a>
	<!-- mobile 화면에서 로그인 -->
	<p class="btm_btn_area ver_mobile">
		<input type="button" name="MobileLogin" value="로그인" title="로그인"
			class="btn btnTopLogin" /> | <input type="button" name="MobileJoin"
			value="회원가입" title="회원가입" class="btn btnTopJoin" /> <input
			type="button" name="" id="edu002A03이지스에듀" value="이지스에듀" title="이지스에듀"
			class="btn btn_short_cut btnMainLink" />
	</p>
	<!-- mobile 화면에서 로그인// -->
	</div>
	<img src="/82_Menu/MemberStatOK" alt="" width="0" height="0" />

	<!-- 이전 코드 <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-116139153-1', 'auto');
  ga('send', 'pageview');
</script> -->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-116139153-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-116139153-1');
	</script>
	<!-- footer : e -->
	</div>
	<form method="post" id="frmSearch" name="frmSearch"
		action="/20_Menu/BookList/PUB" onsubmit="return true;">
		<input type="hidden" id="BOOK_IDX" name="BOOK_IDX" value="" /> <input
			type="hidden" id="page" name="page" value="1" /> <input
			type="hidden" id="ShKeyfield" name="ShKeyfield" value="" /> <input
			type="hidden" id="ShKeyword" name="ShKeyword" value="" /> <input
			type="hidden" id="ShMaxpage" name="ShMaxpage" value="" /> <input
			type="hidden" id="ShOrderby" name="ShOrderby" value="" />
	</form>
	<script type="text/javascript">
		// slider book list
		$(document)
				.ready(
						function() {
							resizeContent();
							var cnt = 0;
							var loopcnt = $('.selbook').find('li').size() - 1;
							$('.arrow_left').click(
									function() {
										$('.selbook').find('li').eq(0).before(
												$('.selbook').find(
														'>li:last-child'));
									});
							$('.arrow_right').click(
									function() {
										$('.selbook').append(
												$('.selbook').find(
														'>li:first-child'));
									});
							$('.BtnPageView').click(
									function(e) {
										$('#BOOK_IDX').val(
												$(this).attr('alt').replace(
														"V", ""));
										$('#frmSearch').attr(
												'action',
												'/20_Menu/BookView/'
														+ $(this).attr('alt')
																.replace("V",
																		"")
														+ '/PUB').submit();
									});

							//lert($('.movie_area').find('iframe').length);
							var movieCnt = $('.movie_area').find('iframe').length;
							if (0 < movieCnt) {
								$('.movie_area').find('iframe').attr("width",
										"240").attr("height", "197");
							}

							$('.btnBoardView')
									.click(
											function() {
												document.location.href = '/12_Menu/BoardView/C200/'
														+ $(this).attr('seq')
														+ '/PUB';
											});
						});
		$(window).resize(function() {
			resizeContent();
		});

		function resizeContent() {
			var sliderWidth = $('.main_book_list ul').width();
			$('.main_book_list ul').css({
				'width' : (sliderWidth) + 'px'
			});
			$('.main_book_list ul').css({
				'margin-left' : -(sliderWidth / 2) + 'px'
			});
		}

		function getCookie(name) {
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie) {
					if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
						endOfCookie = document.cookie.length;
					return unescape(document.cookie.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf(" ", x) + 1;
				if (x == 0)
					break;
			}
			return "";
		}
	</script>
	<script type="text/javascript">
		var mapOptions = {
			center : new naver.maps.LatLng(37.5662952, 126.97794509999),
			zoom : 7
		};

		var map = new naver.maps.Map('map', mapOptions);

		function drawMap(v) {

			data = eval(v);
			markers = [], infoWindows = [];

			map.setOptions("center", new naver.maps.LatLng(37.5662952,
					126.97794509999));
			map.setOptions("zoom", 7);

			for (var i = 0; i < data.length; i++) {

				var boardNum = data[i].boardNum;
				var iconImg = "${pageContext.request.contextPath}/images/gray_64.png";

				if (boardNum > 0) {
					if (boardNum >= 1 && boardNum <= 3) {
						iconImg = '${pageContext.request.contextPath}/images/red_64.png';
					} else if (boardNum >= 4 && boardNum <= 6) {
						iconImg = '${pageContext.request.contextPath}/images/yellow_64.png';
					} else if (boardNum >= 7 && boardNum <= 9) {
						iconImg = '${pageContext.request.contextPath}/images/orange_64.png';
					} else {
						iconImg = '${pageContext.request.contextPath}/images/blue_64.png';
					}
				}

				var markerOptions = {
					position : new naver.maps.LatLng(data[i].latitude,
							data[i].longitude),
					map : map,
					icon : {
						url : iconImg
					}
				};

				marker = new naver.maps.Marker(markerOptions);

				var infoWindow = new naver.maps.InfoWindow(
						{
							content : '<div style="width:200px;text-align:center;padding:10px;">'
									+ data[i].stationName
									+ '<br>'
									+ '대여가능 킥보드 수 : '
									+ data[i].boardNum
									+ '</div>'
						});

				markers[i] = marker;
				infoWindows[i] = infoWindow;
			}

			naver.maps.Event.addListener(map, 'idle', function() {
				updateMarkers(map, markers);
			});

			function updateMarkers(map, markers) {
				var mapBounds = map.getBounds();
				var marker, position;

				for (var i = 0; i < markers.length; i++) {
					marker = markers[i];
					position = marker.getPosition();

					if (mapBounds.hasLatLng(position)) {
						showMarker(map, marker);
					} else {
						hideMarker(map, marker);
					}
				}
			}

			function showMarker(map, marker) {
				if (marker.setMap())
					return;
				marker.setMap(map);
			}

			function hideMarker(map, marker) {

				if (!marker.setMap())
					return;
				marker.setMap(null);
			}

			function getClickHandler(seq) {
				return function(e) {
					var marker = markers[seq], infoWindow = infoWindows[seq];

					if (infoWindow.getMap()) {
						infoWindow.close();
					} else {
						infoWindow.open(map, marker);
					}
				}
			}

			for (var i = 0, li = markers.length; i < li; i++) {
				naver.maps.Event.addListener(markers[i], 'click',
						getClickHandler(i));
			}
		}

		function zoomStation(v) {

			data = eval(v);

			map.setOptions("center", new naver.maps.LatLng(data[0].latitude,
					data[0].longitude));
			map.setOptions("zoom", 10);

			var boardNum = data[0].boardNum;
			var iconImg = '${pageContext.request.contextPath}/images/gray_64.png';

			if (boardNum > 0) {
				if (boardNum >= 1 && boardNum <= 3) {
					iconImg = '${pageContext.request.contextPath}/images/red_64.png';
				} else if (boardNum >= 4 && boardNum <= 6) {
					iconImg = '${pageContext.request.contextPath}/images/yellow_64.png';
				} else if (boardNum >= 7 && boardNum <= 9) {
					iconImg = '${pageContext.request.contextPath}/images/orange_64.png';
				} else {
					iconImg = '${pageContext.request.contextPath}/images/blue_64.png';
				}

			}
			var markerOptions = {
				position : new naver.maps.LatLng(data[0].latitude,
						data[0].longitude),
				map : map,
				icon : {
					url : iconImg
				}
			};

			marker = new naver.maps.Marker(markerOptions);

			var infowindow = new naver.maps.InfoWindow(
					{
						content : '<div style="width:150px;text-align:center;padding:10px;">'
								+ data[0].stationName
								+ '<br>'
								+ '대여가능 킥보드 수 : ' + data[0].boardNum + '</div>'
					});

			naver.maps.Event.addListener(marker, "click", function(e) {
				if (infowindow.getMap()) {
					infowindow.close();
				} else {
					infowindow.open(map, marker);
				}
			});

		}
	</script>
</body>

</html>
