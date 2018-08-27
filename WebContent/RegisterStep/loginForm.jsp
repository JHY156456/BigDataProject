	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta name="description=" Content="" />
<!-- 이지스 퍼블리싱 js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/easy_js/jquery-1.11.2.min.js"></script>
	
	
	
<title>3H Board :: 로그인</title>
<link href="${pageContext.request.contextPath}/login_css/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/jquery-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/easing/jquery.easing.1.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/gibberish-aes.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/jquery.simpler-sidebar.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/login_js/comm.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login_css/style_kr_v2.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login_css/common.css"
	type="text/css">
<!--[if lt IE 9]>
<link href="${pageContext.request.contextPath}/login_css/pw.css" title="ie8chn" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/login_js/html5.js"></script>
<script src="${pageContext.request.contextPath}/login_js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="wrap">

		<div class="container">
			<div class="content">

				<div class="login">
					<!--웹 : class="top"에"logo" 스타일추가 -->
					<div class="top logo">
						<!--웹 : 로고이미지추가 -->
						<h3>
							로그인<img
								src="${pageContext.request.contextPath}/images/logo_pub.png"
								alt="서울자전거 따릉이">
						</h3>
						<button class="back"></button>
						<button class="close"></button>
					</div>

					<form name='loginForm'
						action="${pageContext.request.contextPath}/cont" method="POST">
						<input type="hidden" name="command" value="login">
						<div class="id">
							<input type="text" id="memid" name="id" placeholder="아이디" />
						</div>

						<div class="pw">
							<input type="password" id="mempw" name="password"
								placeholder="비밀번호">
						</div>

						<div class="login_auto">
							<input type="checkbox" name="loginchk" id="loginCheck" /><label
								for="loginCheck" id="logchktext"><span></span>로그인 상태 유지</label>
						</div>

						<div class="login_btns" id="loginBtn">
							<input type="submit" class="write" id="submitButton" value="로그인"
								style="line-height: 43px; text-align: center; display: block; cursor: pointer; width: 100%; height: 43px; font-weight: bold; font-size: 12px; border-radius: 3px; color: #333; background: #72ebc9 url(/images/kr/icon/ic_join.png) left 14px center no-repeat;">
						</div>

						<input type="hidden" id="ostype" name="appOsType" value="web" />
						<input type="hidden" id="usrDeviceId" name="usrDeviceId" />
					</form>

					<ul class="idpw">
						<li class="srch_id"><a href="${pageContext.request.contextPath}/RegisterStep/MemberRegister01.jsp"
							id="memberReg">회원가입</a></li>
						<li class="srch_id"><a href="/memberIdFind.do" id="findIdId">아이디
								찾기</a></li>
						<li class="srch_pw"><a href="/memberPwFind.do" id="findIdPw">비밀번호
								찾기</a></li>
					</ul>
					<div class="join_btns">
						<ul>
							<li class="line"><img src="/images/join_line.jpg" alt=""></li>
							<li class="join_naver"><a href="/naverLogin.do?type=login">네이버
									계정으로 로그인</a></li>
							<li class="join_facebook"><a
								href="/facebookLogin.do?type=login">페이스북 계정으로 로그인</a></li>
							<li class="join_kakao"><a href="/kakaoLogin.do?type=login">카카오
									계정으로 로그인</a></li>
						</ul>
					</div>

				</div>


			</div>
		</div>


	</div>
	<!--footer-->
	<div class="footer_wrap">
		<div class="footer">
			<div class="left">
				<ul>
					<!--<li><a href="">개인정보처리방침</a></li>
                <li class="line"><a href="">이메일주소무단수집거부</a></li>-->
					<li><a href="/app/use/moveUseMenuClauseInfo.do">이용약관</a></li>
					<li class="line"><a href="/app/use/moveUseMenuInsurance.do">보험안내</a></li>
					<li class="line"><a href="/customer/notice/noticeList.do">공지사항</a></li>
					<li class="line"><a href="/customer/donor/donorList.do">도움주신
							분</a></li>

				</ul>
				<p>서울특별시 중구 세종대로 110 서울특별시 대표자 신혜영, Tel : 010-1234-1234
					</p>
				<p>관리책임자:담당자명e-mail@email.co.kr COPYRIGHT ⓒ 2018
					All RIGHTS RESERVED.</p>
			</div>
			<dl>
				<dt>sns</dt>
				<dd class="face" onclick="javascript:moveSnsViewPage('snsFacebook')">
					<a href="#" id="snsFacebook"> </a>
				</dd>
				<dd class="twit" onclick="javascript:moveSnsViewPage('snsTweeter')">
					<a href="#" id="snsTweeter"> </a>
				</dd>
			</dl>
		</div>
	</div>
	<!--footer-->
<script type="text/javascript">
window.onload = function(){
	$('#memid').focus();
}
</script>
	<script type="text/javascript">
		$(function() {
			
			
			var mainType = cookieVal("mainType");

			if (mainType == 'text') {
				$(".mainTypeMap").css('display', '');
				$(".mainTypeText").css('display', 'none');
			} else if (mainType == 'map') {
				$(".mainTypeMap").css('display', 'none');
				$(".mainTypeText").css('display', '');
			} else {
				$(".mainTypeMap").css('display', 'none');
				$(".mainTypeText").css('display', '');
			}
		});

		$(function() {
			$(".back").on("click", goBack);
		});

		$(function() {
			$(".back.left").on("click", goBackLeft);
		});

		$(function() {
			$(".back.right").on("click", goBackRight);
		});

		$(function() {
			$(".pwback").on("click", goBack);
		});
		$(function() {
			$(".close").on("click", goHome);
		});
		$(function() {
			$(".logo").on("click", goHome);
		});
		$(function() {
			$(".alim").on("click", goAlim);
		});
		$(function() {
			$("#changeLang").on("click", changeLang);
		});
		function osInfo(pOSobj) {
			var obj = JSON.parse(pOSobj);
			window.osType = obj.osInfo;

			//대여소 찿기 PDF 버튼 숨기기.
			if ($("#pdfDiv") !== 'undefined') {
				$("#pdfDiv").css("display", "none");
			}
		};

		function goBack(e) {
			//e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			window.osType = '';
			//alert(window.osType);
			switch (window.osType) {
			case "web":
				window.history.go(-1);
				break;
			case "android":
				window.android.goBack();
				break;
			case "ios":
				window.location = 'toApp://?{"call":"goBack"}';
				break;
			case "":
				window.history.go(-1);
				break;
			}
		}

		function goBackLeft(e) {
			//e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			switch (window.osType) {
			case "web":
				window.location.href = '/main.do';
				break;
			case "android":
				window.location.href = '/main.do';
				break;
			case "ios":
				window.location.href = '/main.do';
				break;
			case "":
				window.location.href = '/main.do';
				break;
			}
		}

		function goBackRight(e) {
			//e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			switch (window.osType) {
			case "web":
				window.location.href = '/main.do';
				break;
			case "android":
				window.location.href = '/main.do';
				break;
			case "ios":
				window.location.href = '/main.do';
				break;
			case "":
				window.location.href = '/main.do';
				break;
			}
		}

		function goHome(e) {
			//e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			switch (window.osType) {
			case "web":
				window.location.href = '/main.do';
				break;
			case "android":
				window.location.href = '/main.do';
				break;
			case "ios":
				window.location.href = '/main.do';
				break;
			case "":
				window.location.href = '/main.do';
				break;
			}
		}

		function goAlim(e) {
			//e.preventDefault();
			//alert("2->"+e.type +":"+ window.osType);
			switch (window.osType) {
			case "web":
				window.location.href = '/app/mybike/getPushHistory.do';
				break;
			case "android":
				window.location.href = '/app/mybike/getPushHistory.do';
				break;
			case "ios":
				window.location.href = '/app/mybike/getPushHistory.do';
				break;
			case "":
				window.location.href = '/app/mybike/getPushHistory.do';
				break;
			}
		}

		function changeLang(e) {
			var lang = 'en'

			switch (window.osType) {
			case "web":
				window.location.href = '/main.do?lang=' + lang;
				break;
			case "android":
				window.location.href = '/main.do?lang=' + lang;
				break;
			case "ios":
				window.location.href = '/main.do?lang=' + lang;
				break;
			case "":
				window.location.href = '/main.do?lang=' + lang;
				break;
			}
		}

		function moveSnsViewPage(flag) {

			var tUrl = "";
			if (flag === 'snsFacebook') {
				tUrl = "https://www.facebook.com/seoulbike";
			} else {
				tUrl = "https://twitter.com/seoulbike";
			}
			switch (window.osType) {
			case "web":
				window.open(tUrl, "_blank");
				break;
			case "android":
				var pData = {
					targetUrl : tUrl,
					returnFnc : "",
					title : "서울자전거sns"
				};
				window.android.openWebviewPopup(JSON.stringify(pData));
				break;
			case "ios":
				var iosUrl = 'toApp://?{"targetUrl" : "'
						+ tUrl
						+ '","title" : "서울자전거sns", "returnFnc" : "", "call":"openWebviewPopup"}';
				window.location = iosUrl;
				break;
			}
		}
	</script>
	
	

</body>
</html>
