<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="time" class="java.util.Date" />	<!-- 현재시간  -->
<fmt:formatDate value="${time}" var="curTime" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${time}" var="curYear" pattern="yyyy" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Customer</title>
<style>
	body {
		padding-left: 50px;
	    padding-top: 20px;
	}
    #customerTable {
   	   	border-collapse: collapse;
   	}
   	#customerTable td {
       	height: 40px;
       	border: 1px solid lightgray;
   	}
   	#customerTable tr>td:nth-child(1) {
        width: 150px;
        background-color: #2E9AFE;
        color: white;
        font-weight: bold;
        text-align: center;
    }
    #customerTable tr>td:nth-child(2) {
        width: 450px;
    }
    .customer-insert {
    	width: 250px;
    	height: 100%;
    	padding-left: 30px;
    	margin-right: 10px;
    }
    .customer-noinsert {
    	padding-left: 30px;
    }
    .printNotice {
    	color: red;
    	font-size: 13px;
    }
</style>
</head>
<body>
	<h2>고객 정보 등록</h2>
	<form:form modelAttribute="customer" name="form" action="customerWrite.html" method="post" onSubmit="return clickEvent('등록')">
		<table id="customerTable">
		    <tbody>
		        <tr>
		            <td>색인</td>
		            <td class="customer-noinsert">신규</td>
		        </tr>
		        <tr>
		        	<td>가입일</td>
		        	<td class="customer-noinsert"><form:input path="regDate" value="${curTime }" readOnly="true" style="border:none;" /></td>
		        </tr>
		        <tr>
		            <td>아이디</td>
		            <td>
		            	<form:input path="loginId" class="customer-insert" placeHolder="아이디" maxlength="15" required="true" onClick="setPrintNotice('id')" />
		            	<span id="idNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>비밀변호</td>
		            <td>
		            	<form:input path="loginPwd" class="customer-insert" placeHolder="비밀번호" maxlength="15" required="true" onClick="setPrintNotice('pwd')" />
		            	<span id="pwdNotice" class="printNotice"></span>	
		            </td>
		        </tr>
		        <tr>
		            <td>이름</td>
		            <td>
		            	<form:input path="name" class="customer-insert" placeHolder="이름" maxlength="15" required="true" onClick="setPrintNotice('name')" />
		            	<span id="nameNotice" class="printNotice"></span>
		            </td>	<!-- 이름 -->
		        </tr>
		        <tr>
		            <td>생년월일</td>
		            <td class="customer-noinsert">
		            	<select name="year">
		            	<c:forEach var="year" begin="0" end="${curYear-1990 }" step="1">
		            		<option value="${curYear-year }">${curYear-year }</option>
		            	</c:forEach>
		            	</select> 년&nbsp;
		            	<select name="month">
		            	<c:forEach var="month" begin="1" end="12" step="1">
	            			<option value="${month }">${month }</option>
		            	</c:forEach>
		            	</select> 월&nbsp;
		            	<select name="day">
		            	<c:forEach var="day" begin="1" end="31" step="1">
	            			<option value="${day }">${day }</option>
		            	</c:forEach>
		            	</select> 일
		            	<form:hidden path="birthDate" />
		            </td>
		        </tr>
		        <tr>
		            <td>나이</td>
		            <td>
		            	<input name="age" class="customer-insert" placeHolder="나이" maxlength="2" required onClick="setPrintNotice('age')" />
		            	<span id="ageNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>성별</td>
		            <td class="customer-noinsert">
		            	<form:radiobutton path="gender" value="M" onClick="setPrintNotice('gender')" required="true" />남	<!-- 성별 -->
		            	<form:radiobutton path="gender" value="W" onClick="setPrintNotice('gender')" required="true"/>여
		            	&emsp;<span id="ageNotice" class="printNotice"></span>
	            	</td>
		        </tr>
		        <tr>
		            <td>이메일</td>
		            <td>
		            	<form:input path="email" class="customer-insert" placeHolder="이메일" maxlength="30" required="true" onClick="setPrintNotice('email')" />
		            	<span id="emailNotice" class="printNotice"></span>
		            </td>
		        </tr>
		    </tbody>
		</table>
		<input type="submit" value="등록" />
		<input type="button" value="취소" onClick="clickEvent('취소')" />
	</form:form>

		
	<script>
		var form = document.form;
		
		function clickEvent(type) {
			if (type == "등록") {	// 등록
				// 유효성 체크
				var checkId = checkIdValidity();
				var checkPwd = checkPwdValidity(); 
				var checkName = checkNameValidity();
				var checkAge = checkAgeValidity();
				var checkGender = checkGenderValidity();
				var checkEmail = checkEmailValidity();
				
				if ( checkId && checkPwd && checkName  
						&& checkAge && checkGender && checkEmail ) {
					setBirthDate();
					
					return true;
				} else {
					return false;
				}
			} else {	// 취소
				window.location = "customerList.html";
			}
		}
		
		function setBirthDate() {
			form = document.form;
			
			var year = form.year.value;
			var month = form.month.value;
			var day = form.day.value;
			form.birthDate.value = year + "-" + month + "-" + day;
		}
	</script>
	<script type="text/javascript" src="./js/customerValidity.js"></script>
</body>
</html>