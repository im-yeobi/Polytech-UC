<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
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
   	   	border: 1px solid lightgray;
   	}
   	#customerTable td {
       	height: 40px;
   	}
   	.table-name {
        width: 150px;
        background-color: #2E9AFE;
        color: white;
        font-weight: bold;
        text-align: center;
        border-bottom: 1px solid lightgray;
        border-right: 1px solid lightgray;
    }
    .table-phone {
    	width: 65px;
    	background-color: #2E9AFE;
        color: white;
        font-weight: bold;
        text-align: center;
    }
    .table-content {
    	width: 450px;
    	padding-left: 30px;
    	border-bottom: 1px solid lightgray;
    }
    .table-number {
    	background-color: #DB7093;
        color: white;
        font-weight: bold;
        text-align: center;
        border-top: 1px solid lightgray;
        border-left: 1px solid lightgray;
        border-right: 1px solid lightgray;
    }
    .table-menu {
    	background-color: #3CB371;
        color: white;
        font-weight: bold;
        text-align: center;
        border-left: 1px solid lightgray;
        border-right: 1px solid lightgray;
    }
    .phone-number {
    	width: 450px;
    	padding-left: 30px;
    }
    #numberClick {
    	cursor: pointer;
    }
    #numberClick:hover {
    	text-decoration: underline;
    	color: 	#000080;
    }
    .customer-info {
     	border: none;
    	font-size: 15px;
    }
</style>
</head>
<body>
	<h2>고객 세부 정보</h2>
	
	<table id="customerTable">
	    <tbody>
	    <form:form modelAttribute="customer" id="form" method="post">
	        <tr>
	            <td class="table-name" colspan="2">색인</td>
	            <td class="table-content"><form:input path="id" class="customer-info" readOnly="true" /></td>
	        </tr>
	        <tr>
	        	<td class="table-name" colspan="2">가입일</td>
	        	<td class="table-content"><form:input path="regDate" class="customer-info" readOnly="true" /></td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">ID</td>
	            <td class="table-content">
	            	<form:input path="loginId" class="customer-info" readOnly="true" />
	            	<form:hidden path="loginPwd" readOnly="true"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">이름</td>
	            <td class="table-content"><form:input path="name" class="customer-info" readOnly="true" /></td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">생년월일</td>
	            <td class="table-content">
	            	<form:input path="birthDate" class="customer-info" readOnly="true" />
	            </td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">나이</td>
	            <td class="table-content"><form:input path="age" class="customer-info" readOnly="true" /></td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">성별</td>
	            <td class="table-content">
		            <c:choose>
		                <c:when test="${customer.gender == 'M' }">
		                	<input type="text" value="남" readOnly style="border:none;" />
		                </c:when>
		                <c:otherwise>
		                	<input type="text" value="여" readOnly style="border:none;" />
		                </c:otherwise>
	                </c:choose>
	            	<form:hidden path="gender" readOnly="true" />
	            </td>
	        </tr>
	        <tr>
	            <td class="table-name" colspan="2">이메일</td>
	            <td class="table-content"><form:input path="email" class="customer-info" readOnly="true" /></td>
	        </tr>
       	</form:form>
       	
       	<tr>
       		<c:choose>
	       		<c:when test="${mobilePhones.size() == 0 }">
	       			<td rowspan="2" class="table-phone">전화기</td>
	       		</c:when>
	       		<c:otherwise>
	       			<td rowspan="${mobilePhones.size()+1 }" class="table-phone">전화기</td>	
	       		</c:otherwise>
       		</c:choose>
			<td class="table-menu">휴대폰 메뉴</td>
			<td class="phone-number">
				<input type="button" value="휴대폰 등록" onClick="phoneClickEvent('등록', '${customer.id}', '${customer.name }')" />
    			<input type="button" value="휴대폰 해지" onClick="phoneClickEvent('해지', '${customer.id}', null)" />
<%--     			<input type="button" value="휴대폰 수정" onClick="phoneClickEvent('수정', '${customer.id}', null)" /> --%>
     		</td>
		</tr>
		<c:choose>
	       	<c:when test="${mobilePhones.size() == 0 }">
	       		<tr>
	       			<td style="border-right: 1px solid lightgray; background-color:lightgray"></td>
	       			<td style="font-weight: bold; text-align: center;">휴대폰을 등록해주세요.</td>
	       		</tr>	
	       	</c:when>
     	</c:choose>
       	<c:if test="${mobilePhones.size() >= 1 }">
       	<form name="phoneForm" action="mobilePhoneDelete.html" method="post">
	        <c:forEach items="${mobilePhones }" var="mobilePhone" varStatus="cnt">
	        	<tr>    	
	        		<td class="table-number">휴대폰 ${cnt.index+1 }</td>
	        		<td class="phone-number">
	        			<input type="checkbox" name="delCheck" value="${mobilePhone.id }" />
	        			<span id="numberClick" onClick="numberClickEvent('${mobilePhone.id}')">${mobilePhone.phoneNumber }</span>
	        		</td>
	        	</tr>
	       	</c:forEach>
	       	<input type="hidden" name="customerId" value="${customer.id }" />
	       	<input type="hidden" name="mobileId" />
       	</form>
       	</c:if>
	    </tbody>
	</table>
	
	<input type="button" value="목록" onClick="clickEvent('목록')" />
	<input type="button" value="수정" onClick="clickEvent('수정')" />
	<input type="button" value="삭제" onClick="clickEvent('삭제')" />
	
	<script>
		function clickEvent(type) {
			var form = document.getElementById('form');
			
			if (type == "목록") {	// 목록
				window.location = "customerList.html";
			} else if (type == "수정") {	// 수정
				form.action = "customerUpdate.html";
				form.submit();
			} else { // 삭제
				alert("정말 삭제하시겠습니까?");
				form.action = "customerDelete.html";
				form.submit();
			}
		}
		
		function phoneClickEvent(type, customerId, customerName) {
			var form = document.phoneForm;
			
			if (type == "등록") {	// 등록
				var url = encodeURI("mobilePhoneInsert.html?customerId=" + customerId + "&customerName=" + customerName);
// 				window.open(url, "mobileInsert", "width=650px, height=280px, resizeable=no, scrollbars=no, " 
// 								+ "left=" + ((screen.availWidth - 650) / 2) + ", top=" + ((screen.availHeight - 280) / 2));
				createPopup(url , "mobileInsert", 650, 280);
			} else if (type == "해지") {	// 해지
				var checkBoxes = document.querySelectorAll('input[name=delCheck]:checked');				
				var checkId;
				var cnt = 0;
				for(var i = 0; i < checkBoxes.length; i++) {
					if (cnt == 0) {
						checkId = checkBoxes[i].value; 
						cnt++;
					} else {
						checkId += "," + checkBoxes[i].value;						
					}
				}
				
				if (cnt >= 1) {
					form.mobileId.value = checkId;
					form.submit();
				}
				
			} 
		}
		
		function numberClickEvent(phoneId) {
			var url = "mobilePhoneShow.html?id=" + phoneId;
			createPopup(url , "mobileShow", 650, 280);
// 			window.open(url, "mobileShow", "width=650px, height=280px, resizeable=no, scrollbars=no, " 
// 							+ "left=" + ((screen.availWidth - 650) / 2) + ", top=" + ((screen.availHeight - 280) / 2));
		}
		
		function createPopup(url, name, width, height) {
			var popupX = (screen.availWidth - width) / 2;
			var popupY = (screen.availHeight - height) / 2;
			var popupOption = "width=" + width + "px, height=" + height + "px, resizable=no, scrollbars=no, left=" + popupX + ", top=" + popupY;
			window.open(url, name, popupOption);
		}
	</script>  
</body>
</html>