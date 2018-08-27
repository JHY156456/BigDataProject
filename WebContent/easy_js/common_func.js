//------------------------------------------------------------------------------
// 모바일에서 주소 표시줄 감추기
//------------------------------------------------------------------------------
function scroll2Top(){
	var fn = function(){
		var top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
		if(top === 0){
			window.setTimeout(scrollTo, 0, 0, 1);
		}
	};
	window.setTimeout(fn, 500);
}

if(window.attachEvent){
	window.attachEvent("load", scroll2Top);
} else {
	window.addEventListener("load", scroll2Top);
}

//------------------------------------------------------------------------------
// Gnb
//------------------------------------------------------------------------------
$(document).ready(function(){
    $('#menu li').hover(function(){
            $(this).find('ul:first').css({visibility: "visible",display: "none"}).fadeIn(400); // effect 1
            // $(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown(400); // effect 2
        },function(){
            $(this).find('ul:first').css({visibility: "hidden"});
        });
	$('#gnb .depth03').parent().prev().addClass('arrow');
	$('#gnb .depth04').prev().addClass('arrow');
	$('#gnb ul.depth04>li:even').addClass('even')
	$('#gnb ul.depth04>li:odd').addClass('odd')
});


$(function(){
	$(".wrap").css("height", "100%");
	$(".wrap").append('<div id="overlay"><div>');	

	function slideControl() {
		if($("#gnb .menu_area").is(":hidden")){
			$("#gnb .menu_area").show();
			$("#gnb .menu_area").animate({left:"0"}, 120);
			$("#top" ,"#container").animate({left:"240px"}, 120);
			//$(".gnb_wrap").css("left","0");
			//$(".mainSection").css("left","240px");
			$(".wrap").css("overflow", "hidden");
			$("#overlay").show();
		} else {
			$("#gnb .menu_area").animate({left:"-240px"}, 60, function(){
				$("#gnb .menu_area").hide();
			});
			$("#container").animate({left:"0"}, 60, function(){
				$(".wrap").css("overflow", "visible");
			});
			$("#overlay").hide();
		}
	}

	$('.btn_open_menu').click(function(){
		slideControl();
	});
	$("#overlay").click(function(){
		slideControl();
	});
	$('.btn_close_menu').click(function(){
		$("#gnb .menu_area").animate({left:"-240px"}, 60, function(){
			$("#gnb .menu_area").hide();
		});
		$("#container").animate({left:"0"}, 60, function(){
			$(".wrap").css("overflow", "visible");
		});
		$("#overlay").hide();
	});	
});


//------------------------------------------------------------------------------
// Top Button
//------------------------------------------------------------------------------
$(document).ready(function(){
	$('.wrap').append('<a class="btnGoTop" title="페이지 상단으로 이동"><img src="/images/btn_top.png" alt=""></a>');

	$('.btnGoTop').hide();
	$(window).scroll(function(){
		var winH = $(window).scrollTop();
		var docH = $(document).height() - $(window).height();
		if (winH > 180){
			if($('.btnGoTop').css("display")=="none"){
				$('.btnGoTop').fadeIn();
			}
		} else {
			$('.btnGoTop').hide();
		}
	});

	$('.btnGoTop').click(function(){
		$('html, body').animate({scrollTop:0}, 'fast');
	});
});


//------------------------------------------------------------------------------
// 달력 : jquery-ui-1.11.2.min.js > datepicker
//------------------------------------------------------------------------------
$(function(){
	var date = new Date();
	$( ".nlDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true // 전월, 익월 표시
	});

	$( ".btDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		yearRange: 'c-100:c',
		showOtherMonths: true // 전월, 익월 표시
	});

	$( ".prevDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		//yearRange: 'c-100:c',
		maxDate:0,
		showOtherMonths: true // 전월, 익월 표시
	});

	$( ".nextDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		minDate:0,
		showOtherMonths: true // 전월, 익월 표시
	});

	$( ".fmDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$(this).next().datepicker( "option", "minDate", selectedDate );
		}
	});

	$( ".toDate" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$(this).prev().datepicker( "option", "maxDate", selectedDate );
		}
	});
	
	$( ".fmDate1" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".toDate1" ).datepicker( "option", "minDate", selectedDate );
		}
	});

	$( ".toDate1" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".fmDate1" ).datepicker( "option", "maxDate", selectedDate );
		}
	});

	$( ".fmDate2" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".toDate2" ).datepicker( "option", "minDate", selectedDate );
		}
	});

	$( ".toDate2" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".fmDate2" ).datepicker( "option", "maxDate", selectedDate );
		}
	});

	$( ".fmDate3" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".toDate3" ).datepicker( "option", "minDate", selectedDate );
		}
	});

	$( ".toDate3" ).datepicker({
		regional:'ko',
		dateFormat:"yy-mm-dd",
		changeMonth: true,
		changeYear: true,
		showOtherMonths: true, // 전월, 익월 표시
		onClose: function( selectedDate ) {
			$( ".fmDate3" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});


//------------------------------------------------------------------------------
// 공통 자바스크립트 함수 모듈
//------------------------------------------------------------------------------

function setCookie(name,value,expires) { document.cookie=name + "=" + escape(value) + ((expires == null)? "" : (" ; expires=" + expires.toGMTString())) + "; path=/; domain=www.wineplaza.co.kr"; }
function getCookie(name) { var arg = name + "="; var alen = arg.length; var clen = document.cookie.length; var i = 0; while(i< clen) { var j = i + alen; if(document.cookie.substring(i,j)==arg){ var end = document.cookie.indexOf(";",j); if(end == -1) end = document.cookie.length; return unescape(document.cookie.substring(j,end)); } i=document.cookie.indexOf(" ",i)+1; if (i==0) break; } return null; }

// 브라우저 체크 함수
function userAgent() {
	if ((/msie/i).test(navigator.userAgent)) return "ie";
	if ((/msie 6/i).test(navigator.userAgent)) return "ie6";
	if ((/msie 7/i).test(navigator.userAgent)) return "ie7";
	if ((/msie 8/i).test(navigator.userAgent)) return "ie8";
	if ((/msie 9/i).test(navigator.userAgent)) return "ie9";
	if ((/firefox/i).test(navigator.userAgent)) return "firefox";
	if ((/applewebkit/i).test(navigator.userAgent)) return "apple"; //safari. chrome
	if ((/opera/i).test(navigator.userAgent)) return "opera";
	if ((/(ipod|iphone|ipad)/i).test(navigator.userAgent)) return 	"ios";
	if ((/(ipad)/i).test(navigator.userAgent)) return "ipad";
	if ((/android/i).test(navigator.userAgent)) return "android";
}

function setPng24(obj) { 
    obj.width=obj.height=1; 
    obj.className=obj.className.replace(/\bpng24\b/i,''); 
    obj.style.filter = 
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+ obj.src +"',sizingMethod='image');" 
    obj.src='';  
    return ''; 
}

function htmltodbFun(str) {
	var sting = str
	
	sting = sting.replace(";","&#59;");
	sting = sting.replace("<","&lt;");
	sting = sting.replace(">","&gt;");
	sting = sting.replace("'","&#39;");
	sting = sting.replace("'","&#34;");
	sting = sting.replace("|","#chr124");
	sting = sting.replace("--","#45;&#45;");
	
	return sting;
}

function dbtohtmlFun(str) {
	var sting = str
	
	sting = sting.replace("&#59;", ";");
	sting = sting.replace("&lt;", "<");
	sting = sting.replace("&gt;", ">");
	sting = sting.replace("&#39;", "'");
	sting = sting.replace("&#34;", "'");
	sting = sting.replace("#chr124","|");
	sting = sting.replace("#45;&#45;", "--");
	
	return sting;
}

// 공백 체크 함수
function IsEmpty(keyword) {
	var st_num, key_len;
	st_num = keyword.indexOf(" ");	
	
	while (st_num != -1) {
		keyword = keyword.replace(" ", "");
		st_num  = keyword.indexOf(" ");
	}
	key_len=keyword.length;
	return key_len;
}

// 스트링 체크 함수
function checkstr(pstr, pvalid, han) {
	var valid = pvalid;
	var tmp;
	var flag = true;
	
	for (var i = 0; i < pstr.length; i++) {
		flag = true;
		tmp = "" + pstr.substring(i, i+1);
		if (han != 1) {
			if (valid.indexOf(tmp) == "-1") {
				return false;
			}
		} else {
			ch = escape(pstr.charAt(i));        //ISO-Latin-1 문자셋으로 변경
			if (valid.indexOf(tmp) == "-1" && strCharByte(ch) != 2) {
				return false;
			}
		}
	}
	return true;;
}

// 숫자 체크 함수
function IsNumber(field) {
    for (i=0; i < field.value.length ;i++){
        if ((field.value.substr(i,1) < '0' || field.value.substr(i,1) > '9')) {
			alert("숫자만 입력 가능합니다.");
			field.value = "";
			field.focus();
		}
    }
}
function IsOnlyNumber(e, field) {
	if ((e.keyCode<48 || e.keyCode>57) && (e.keyCode<96 || e.keyCode>105) && e.keyCode!=8) {
		if (IsEmpty(field.value)) {
			alert("숫자만 입력 가능합니다.");
			field.value = "";
			field.focus();
		}
	}
}
function IsDigitStr(pstr) {
	var valid = "0123456789";
	return checkstr(pstr, valid, 0);
}

// 영어 및 숫자 체크 함수
function IsAlphaNumeric(checkStr) {
	var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_@.";
	for (i = 0; i < checkStr.length; i++) {
		ch = checkStr.charAt(i);
		for (j = 0; j < checkOK.length; j++)
			if (ch == checkOK.charAt(j))
			break;
			if (j == checkOK.length){
				return (false);
				break;
			}
	}
	return (true);
}

// 숫자에 콤마 찍어주는 함수
function Comma(checkStr) {
	checkStr = '' + checkStr;
	
	//--- 소수점 첫째자리에서 반올림해주는 기능 ---//
	numberTmp = checkStr.split(".");
	if(numberTmp[1]) {
		var c = numberTmp[1].substring(0,1);
		if(c >= 0 && c < 5)
			checkStr = eval(numberTmp[0]);
		else
			checkStr = eval(numberTmp[0]) + 1;
	}
	checkStr = ''+ checkStr +'';
	
	//--- Comma찍어주는 기능 ---//
	if (checkStr.length > 3) {
		var mod = checkStr.length % 3;
		var output = (mod > 0 ? (checkStr.substring(0,mod)) : '');
		for (i=0 ; i < Math.floor(checkStr.length / 3); i++) {
			if ((mod == 0) && (i == 0)) {
				output += checkStr.substring(mod+ 3 * i, mod + 3 * i + 3);
			} else {
				output+= ',' + checkStr.substring(mod + 3 * i, mod + 3 * i + 3);
			}
		}
		return (output);
	} else {
		return checkStr;
	}
}

// 숫자에 콤마를 없애주는 함수
function CommaDel(checkStr) {
	NumValue = "";
	NumArray = checkStr.split(",");
	aa = NumArray.length;
	if(aa > 1) {
		for(ii=0; ii < aa; ii++) {
			if(NumArray[ii] == '')
				break;
			else
				NumValue += NumArray[ii];
		}
	} else {
		NumValue = checkStr;
	}
	return(NumValue);
}

// 특정문자를 없애주는 함수
function StringDel(checkStr1, checkStr2) {
	StrValue = "";
	StrArray = checkStr1.split(checkStr2);
	aa = StrArray.length;
	if(aa > 1) {
		for(ii=0; ii < aa; ii++) {
			if(StrArray[ii] == '')
				break;
			else
				StrValue += StrArray[ii];
		}
	} else {
		StrValue = checkStr1;
	}
	return(StrValue);
}

// 금액 확인 함수
function CheckMoney(FormName, FieldName) {
	FormName = eval("document."+ FormName);
	with(FormName) {
		FieldName1 = eval(FieldName);
		FieldName2 = FieldName1.value;
		FieldValue1 = FieldName2.substring(0,1);
		if (FieldValue1=="-") FieldValue2 = FieldName2.substring(1);
		else FieldValue2 = FieldName2;
		//alert(FieldValue2);
		FieldValue3 = CommaDel(FieldValue2);
		if(!IsDigitStr(FieldValue3)) {
			alert("숫자만 입력 가능합니다.");
			FieldName1.value = ""
			FieldName1.focus();
			return;		
		}
		FieldValue4 = Comma(FieldValue3)
		if (FieldValue1=="-") FieldValue = FieldValue1 + FieldValue4;
		else FieldValue = FieldValue4;
		FieldName3 = eval(FieldName);
		FieldName3.value = FieldValue;
	}
}

// 해당 문자열보다 작으면 0 추가 함수
function AddZero(str1, str2) {
	var tmpValue = "";
	var strValue = "";
	
	var tmpStr1 = str1.toString();
	var tmpStr2 = str2.toString();
	
	var strStr1No = tmpStr1.length;
	var strStr2No = tmpStr2.length;
	
	var strLastNo = parseInt(strStr1No) - parseInt(strStr2No);
	
	if (strStr1No <= strStr2No) {
		strValue = tmpStr2;
	} else {
		tmpValue = "";
		for(i=1; i <= strLastNo; i++) {
			tmpValue += "0";
		}
		strValue = tmpValue + tmpStr2;
	}
	return(strValue);
}
function StrPadLeft(num, len, pad) {
	return Array(len-String(num).length+1).join(pad||'0')+num;
}

// 메일 확인 함수
function CheckEmail(checkStr) {
	var checkflag = true;
	var retvalue;
	
	if(window.RegExp){
		var tempstring = "a"
		var exam = new RegExp(tempstring)
		if(tempstring.match(exam)){
			var ret1 = new RegExp("(@.*@)|(\\.\\.)|(@\\.)|(^\\.)");

			var ret2 = new RegExp("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$");
			retvalue=(!ret1.test(checkStr) && ret2.test(checkStr))
		}else{
			checkflag = false;	
		}
	}else{
		checkflag = false;
	}
	if(!checkflag){
		retvalue=((checkStr != "") && (checkStr.indexOf("@"))>0 && (checkStr.indexOf(".")>0));		
	}
	return retvalue
}

// 유효한 날짜인지 점검하는 함수
function CheckDate(pMonth, pDay, pYear){
    var ofd = new Date;
    ofd.setDate(1);

    pMonth = "" + pMonth;
    pDay = "" + pDay;
    pYear = "" + pYear;
    var Year = parseInt(rmleadzero(pYear));
    var Month = rmleadzero(pMonth);
    var Day = rmleadzero(pDay);

    if (isNaN(Year)) Year = 2000;
    if (Year <= 100) Year = Year + 1900;

    ofd.setYear(parseInt(Year));
    ofd.setMonth(parseInt(Month)-1);
    ofd.setDate(parseInt(Day));

    var vy = ofd.getFullYear();
    var vm = ofd.getMonth()+1;
    var vd = ofd.getDate();
    
    if (vy <= 200) vy = vy + 1900;

    fdate = Year+"/"+Month+"/"+Day;
    vdate = vy+"/"+vm+"/"+vd;
    if (fdate != vdate){
        return false;
    }
    return true;
}

// 기준 날짜와의 차이 구하기 함수
function CheckNextDate(v, t) {
	var str = new Array();
	var b = v.split("-");
	var c = new Date(b[0],b[1]-1,b[2]);
	var d = c.valueOf()+1000*60*60*24*t;
	var e = new Date(d);
		
	Year = e.getFullYear();
	Month = e.getMonth()+1;
	if (Month<10) Month = "0"+ Month;
	Day = e.getDate();
	if (Day<10) Day = "0"+ Day;
	SDate = Year +"-"+ Month +"-"+ Day;
			
	return SDate;
}

// 날짜값에서 -.등을 없엔 14자리 함수
function CheckDateFormat1(date) {
	var newDate = new Date(date);
	
	Year   = newDate.getFullYear(), 
	Month  = newDate.getMonth()+1;
	Day    = newDate.getDate();
	Hours  = newDate.getHours();
	Minutes = newDate.getMinutes();
	Seconds = newDate.getSeconds();
	
	if (Month<10) Month = "0"+ Month;
	if (Day<10) Day = "0"+ Day;
	if (Hours<10) Hours = "0"+ Hours;
	if (Minutes<10) Minutes = "0"+ Minutes;
	if (Seconds<10) Seconds = "0"+ Seconds;
	strDate = Year +"-"+ Month +"-"+ Day +"-"+ Hours +"-"+ Minutes +"-"+ Seconds;
	
	return strDate;
}
// 파일 사이즈 체크 : byte
function CheckFileSize(path, type) {
	var img = new Image();
	img.dynsrc = path;
	var size = img.fileSize;

	var resize;
	if (type =="k") {
		resize = size / 1024;
	} else if (type == "m") {
		resize = size / 1024 / 1024;
	} else {
		resize = size;
	}

	return resize;
}

// 파일 확장자 체크
function CheckFileExtension(inp) {
	var lastidx = -1;
	lastidx = inp.lastIndexOf('.');
	var extension = inp.substring(lastidx+1, inp.length);

	return extension;
}

// 업로드 파일체크 함수 (PHP/P/HTML/HTM/EXE)
function CheckFiles(fileis) {
	var filename = fileis;

	if (!IsEmpty(filename)) {		// 파일 선택을 안한경우
	   return true;
	} else {						// 파일선택을 한 경우
		var ext = filename.split(".");
		if (ext[1].toUpperCase() == "PHP" || ext[1].toUpperCase() == "ASP" || ext[1].toUpperCase() == "HTML" || ext[1].toUpperCase() == "HTM" || ext[1].toUpperCase() == "EXE"){
			return true;
		}else{
			return false;
		}
	}
}

// 업로드 이미지체크 함수 (GIF/JPG/JPEG/BMP/PNG)
function CheckImages(fileis) {
	var filename = fileis;

	if (!IsEmpty(filename)) {			// 파일 선택을 안한경우
	   return true;
	} else {							// 파일선택을 한 경우
		var ext = filename.split(".");
		var extension = ext[ext.length-1];
		if (extension.toUpperCase()=="GIF" || extension.toUpperCase()=="JPG" || extension.toUpperCase()=="JPEG" || extension.toUpperCase()=="BMP" || extension.toUpperCase()=="PNG") {
			return true;
		}else{
			return false;
		}
	}
}

function ImagePreViewIt(thisObj, preViewer, preImage) {
	if(!/(\.gif|\.jpg|\.jpeg|\.png|\.swf)$/i.test(thisObj.value)) {
		alert("이미지 형식의 파일을 선택하십시오");
		return;
	}
	
	document.getElementById(preImage).style.display = "none";
	preViewer = (typeof(preViewer) == "object") ? preViewer : document.getElementById(preViewer);
	var ua = window.navigator.userAgent;
	
	if (ua.indexOf("MSIE") > -1) {
		var img_path = "";
		if (thisObj.value.indexOf("\\fakepath\\") < 0) {
			img_path = thisObj.value;
		} else {
			thisObj.select();
			
			var selectionRange = document.selection.createRange();
			img_path = selectionRange.text.toString();
			thisObj.blur();
		}
		preViewer.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='fi" + "le://" + img_path + "', sizingMethod='scale')";
	} else {
		preViewer.innerHTML = "";
		
		var W = preViewer.offsetWidth;
		var H = preViewer.offsetHeight;
		var tmpImage = document.createElement("img");
		preViewer.appendChild(tmpImage);
		
		tmpImage.onerror = function () {
			return preViewer.innerHTML = "";
		}
		tmpImage.onload = function () {
			if (this.width > W) {
				this.height = this.height / (this.width / W);
				this.width = W;
			}
			if (this.height > H) {
				this.width = this.width / (this.height / H);
				this.height = H;
			}
		}
		if (ua.indexOf("Firefox/3") > -1) {
			var picData = thisObj.files.item(0).getAsDataURL();
			tmpImage.src = picData;
		} else {
			tmpImage.src = "file://" + thisObj.value;
		}
	}
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();

	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++) {
			zero += '0';
		}
	}
	return zero + n;
}

//주소찾기 
function searchAddress() {
    //기관에서 주소찾기
    //goPopup();
    //다음에서 주소찾기
    searchAddressByDaum();
 
}
//다음주소찾기
function searchAddressByDaum() {
    var width = 500; //팝업의 너비
    var height = 300; //팝업의 높이
    new daum.Postcode({
        width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
        height: height,
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if (data.userSelectedType === 'R') {
                //법정동명이 있을 경우 추가한다.
                if (data.bname !== '') {
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if (data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("fm_zip1").value = data.postcode1;
            document.getElementById("fm_zip2").value = data.postcode2;
            document.getElementById("fm_addr1").value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            //self.close();
            document.getElementById("fm_addr2").focus();
        }
    }).open({
        left: (window.screen.width / 2) - (width / 2),
        top: (window.screen.height / 2) - (height / 2)
    });
}
function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
    /*
        document.getElementById('roadFullAddr').value = roadFullAddr;
        document.getElementById('roadAddrPart1').value = roadAddrPart1;
        document.getElementById('addrDetail').value = addrDetail;
        document.getElementById('roadAddrPart2').value = roadAddrPart2;
        document.getElementById('engAddr').value = engAddr;
        document.getElementById('jibunAddr').value = jibunAddr;
        document.getElementById('zipNo').value = zipNo;
        document.getElementById('admCd').value = admCd;
        document.getElementById('rnMgtSn').value = rnMgtSn;
        document.getElementById('bdMgtSn').value = bdMgtSn;
        */
    //alert(roadFullAddr);
}
//기관주소찾기
function goPopup(){
    // 주소검색을 수행할 팝업 페이지를 호출합니다.
    // 호출된 페이지에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/01_Include/juso/jusoPopup_utf8.asp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
}

