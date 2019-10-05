<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="time" class="java.util.Date" />	<!-- ����ð�  -->
<fmt:formatDate value="${time}" var="curYear" pattern="yyyy" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
    	background-color: lightgray;
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
	<h2>�� ���� ����</h2>
	<form:form modelAttribute="customer" name="form" action="customerWrite.html" method="post" onSubmit="return clickEvent('�Ϸ�')">
		<table id="customerTable">
		    <tbody>
		        <tr>
		            <td>����</td>
		            <td class="customer-noinsert"><form:input path="id" style="border:none;" readOnly="true" /></td>
		        </tr>
		        <tr>
		        	<td>������</td>
		        	<td class="customer-noinsert"><form:input path="regDate" style="border:none;" readOnly="true" /></td>
		        </tr>
		        <tr>
		            <td>���̵�</td>
		            <td class="customer-noinsert"><form:input path="loginId" style="border:none;" readOnly="true" /></td>
		        </tr>
		        <tr>
		            <td>��к�ȣ</td>
		            <td>
		            	<form:input path="loginPwd" class="customer-insert" placeHolder="��й�ȣ" maxlength="15" required="true" onClick="setPrintNotice('pwd')" />
		            	<span id="pwdNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>�̸�</td>
		            <td>
		            	<form:input path="name" class="customer-insert" placeHolder="�̸�" maxlength="15" required="true" onClick="setPrintNotice('name')" />
		            	<span id="nameNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>�������</td>
		            <td class="customer-noinsert">
		            	<select name="year">
		            	<c:forEach var="year" begin="0" end="${curYear-1990 }" step="1">
		            		<option value="${curYear-year }">${curYear-year }</option>
		            	</c:forEach>
		            	</select> ��&nbsp;
		            	<select name="month">
		            	<c:forEach var="month" begin="1" end="12" step="1">
	            			<option value="${month }">${month }</option>
		            	</c:forEach>
		            	</select> ��&nbsp;
		            	<select name="day">
		            	<c:forEach var="day" begin="1" end="31" step="1">
	            			<option value="${day }">${day }</option>
		            	</c:forEach>
		            	</select> ��
		            	<form:hidden path="birthDate" />
		            </td>
		        </tr>
		        <tr>
		            <td>����</td>
		            <td>
		            	<form:input path="age" class="customer-insert" placeHolder="����" maxlength="2" required="true" onClick="setPrintNotice('age')" />
		            	<span id="ageNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>����</td>
		            <td class="customer-noinsert">
		            	<form:radiobutton path="gender" value="M" required="true" />��
		            	<form:radiobutton path="gender" value="W" required="true" />��
		            	&emsp;<span id="ageNotice" class="printNotice"></span>
		            </td>
		        </tr>
		        <tr>
		            <td>�̸���</td>
		            <td>
		            	<form:input path="email" class="customer-insert" placeHolder="�̸���" maxlength="30" required="true" onClick="setPrintNotice('email')" />
		            	<span id="emailNotice" class="printNotice"></span>
		            </td>
		        </tr>
		    </tbody>
		</table>
		<input type="submit" value="�Ϸ�" onClick="clickEvent('�Ϸ�')" />
		<input type="button" value="���" onClick="clickEvent('���')" />
	</form:form>
	
	<script>
		var form = document.form;
		
		// ��ý����Լ�
		(function() {
			var birth = form.birthDate.value.split("-");
			
			for (var i = 0; i < 2; i++) {
				if (birth[i+1].indexOf(0) == 0)
					birth[i+1] = birth[i+1].substr(1, 1);
			}
			
			form.year.value = birth[0];
			form.month.value = birth[1];
			form.day.value = birth[2];
		})();
	
		function clickEvent(type) {
			if (type == "�Ϸ�") {	// �Ϸ�
				// ��ȿ�� üũ
				var checkPwd = checkPwdValidity(); 
				var checkName = checkNameValidity()
				var checkAge = checkAgeValidity();
				var checkGender = checkGenderValidity();
				var checkEmail = checkEmailValidity();
				
				if ( checkPwd && checkName && checkAge && checkGender && checkEmail ) {
					setBirthDate();
					
					return true;
				} else {
					return false;
				}
			} else {	// ���
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