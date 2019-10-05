<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Mobile Phone</title>
<style>
	#mobilePhoneTable {
	 	border-collapse: collapse;
	}
	#mobilePhoneTable td {
		height: 40px;
		border: 1px solid lightgray;
	}
   	#mobilePhoneTable tr>td:nth-child(1) {
        width: 150px;
        background-color: #2E9AFE;
        color: white;
        font-weight: bold;
        text-align: center;
    }
    #mobilePhoneTable tr>td:nth-child(2) {
        width: 450px;
        padding-left: 30px; 
    }
    #phoneM, #phoneE {
    	width: 50px;
    	text-align: center;
    }
    #checkMsg {
    	color: red;
    	font-size: 13px;
    }
    .telephone-info {
    	border: none;
    }
</style>
</head>
<body>
	<h2>휴대폰 수정</h2>
	<form:form name="form" modelAttribute="mobilePhone" action="mobilePhoneWrite.html" onSubmit="return clickEvent('완료')" method="post">
		<table id="mobilePhoneTable">
			<tbody>
				<tr>
					<td>색인</td>
					<td><form:input class="telephone-info" path="id" readOnly="true" /></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td><form:input class="telephone-info" path="regDate" readonly="true" /></td>
				</tr>
				<tr>
					<td>사용자</td>
					<td>
						<input type="text" class="telephone-info" value="${mobilePhone.customer.name }" readOnly />
						<input type="hidden" name="customerId" value="${mobilePhone.customer.id }" />
					</td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td>
						<select name="phoneS">
							<option value="010">010</option>
							<option value="011">011</option>
						</select> -
						<input type="text" name="phoneM" id="phoneM" maxlength="4" onClick="setCheckMsg()" /> -
						<input type="text" name="phoneE" id="phoneE" maxlength="4" onClick="setCheckMsg()" />
						<input type="button" value="중복체크" onClick="clickEvent('중복')" />
						<span id="checkMsg"></span>
						<form:hidden path="phoneNumber" />
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="완료" />
		<input type="button" value="취소" onClick="clickEvent('취소')" />
	</form:form>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var duplicateFlag = true;	// 휴대폰번호 중복 체크 flag
		var existPhoneNumber = true;	// 휴대폰 번호 존재여부 체크, 가능 true, 불가 false
		var form = document.form;
		
		(function() {	// 즉시실행함수
			var number = form.phoneNumber.value.split("-");
			form.phoneS.value = number[0];
			form.phoneM.value = number[1];
			form.phoneE.value = number[2];
		})();
	
		function clickEvent(type) {
			var checkMsg = document.getElementById('checkMsg');
			
			if (type == "중복") {
				if ( chkOriginalPhoneNumber() == true ) {	// 기존의 휴대폰 번호와 같지 않은 경우만 중복체크
					var checkPhoneNumber = checkPhoneValidity();	// 휴대폰 번호 유효성 체크
					
					if (checkPhoneNumber == true) 
						requestJson();	// 중복 체크 ajax
				} else {	// 기존의 휴대폰 번호와 같은 경우
					checkMsg.innerHTML = "기존의 휴대폰 번호와 동일 !";
					duplicateFlag = true;
					existPhoneNumber = true;
				}
			} else if (type == "완료") {
				if (duplicateFlag == true) {	// 중복 체크 확인한 경우
					if (existPhoneNumber == true) {	// 정상 체크
						setPhoneNumber();
						
						return true;
					} else {	// 중복 폰 번호 존재
						return false;						
					}
				} else {	// 중복 체크 확인하지 않은 경우
					if (checkPhoneValidity() == false) {	// 휴대폰 번호 유호성 오류
						checkMsg.innerHTML = "휴대폰 번호 형식 오류 !";
					} else {
						checkMsg.innerHTML = "번호 중복을 체크해주세요 !";
					}
				
					return false;
				}
			} else {	// 취소
				window.history.back();
			}
		}
		
		function chkOriginalPhoneNumber() {
			var originalPhoneNumber = form.phoneNumber.value;
			
			var start = form.phoneS.value;
			var middle = form.phoneM.value;
			var end = form.phoneE.value;
			var curPhoneNumber = start + "-" + middle + "-" + end;
			
			if (originalPhoneNumber == curPhoneNumber) {
				return false;
			} else {
				return true;
			}
		}
		
		function setCheckMsg() {
			var checkMsg = document.getElementById('checkMsg');
			checkMsg.innerHTML = "";
			duplicateFlag = false;
			existPhoneNumber = false;
		}
	</script>
	<script type="text/javascript" src="./js/telephone.js"></script>
</body>
</html>