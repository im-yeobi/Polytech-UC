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
	<h2>�޴��� ����</h2>
	<form:form name="form" modelAttribute="mobilePhone" action="mobilePhoneWrite.html" onSubmit="return clickEvent('�Ϸ�')" method="post">
		<table id="mobilePhoneTable">
			<tbody>
				<tr>
					<td>����</td>
					<td><form:input class="telephone-info" path="id" readOnly="true" /></td>
				</tr>
				<tr>
					<td>�����</td>
					<td><form:input class="telephone-info" path="regDate" readonly="true" /></td>
				</tr>
				<tr>
					<td>�����</td>
					<td>
						<input type="text" class="telephone-info" value="${mobilePhone.customer.name }" readOnly />
						<input type="hidden" name="customerId" value="${mobilePhone.customer.id }" />
					</td>
				</tr>
				<tr>
					<td>�޴��� ��ȣ</td>
					<td>
						<select name="phoneS">
							<option value="010">010</option>
							<option value="011">011</option>
						</select> -
						<input type="text" name="phoneM" id="phoneM" maxlength="4" onClick="setCheckMsg()" /> -
						<input type="text" name="phoneE" id="phoneE" maxlength="4" onClick="setCheckMsg()" />
						<input type="button" value="�ߺ�üũ" onClick="clickEvent('�ߺ�')" />
						<span id="checkMsg"></span>
						<form:hidden path="phoneNumber" />
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="�Ϸ�" />
		<input type="button" value="���" onClick="clickEvent('���')" />
	</form:form>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var duplicateFlag = true;	// �޴�����ȣ �ߺ� üũ flag
		var existPhoneNumber = true;	// �޴��� ��ȣ ���翩�� üũ, ���� true, �Ұ� false
		var form = document.form;
		
		(function() {	// ��ý����Լ�
			var number = form.phoneNumber.value.split("-");
			form.phoneS.value = number[0];
			form.phoneM.value = number[1];
			form.phoneE.value = number[2];
		})();
	
		function clickEvent(type) {
			var checkMsg = document.getElementById('checkMsg');
			
			if (type == "�ߺ�") {
				if ( chkOriginalPhoneNumber() == true ) {	// ������ �޴��� ��ȣ�� ���� ���� ��츸 �ߺ�üũ
					var checkPhoneNumber = checkPhoneValidity();	// �޴��� ��ȣ ��ȿ�� üũ
					
					if (checkPhoneNumber == true) 
						requestJson();	// �ߺ� üũ ajax
				} else {	// ������ �޴��� ��ȣ�� ���� ���
					checkMsg.innerHTML = "������ �޴��� ��ȣ�� ���� !";
					duplicateFlag = true;
					existPhoneNumber = true;
				}
			} else if (type == "�Ϸ�") {
				if (duplicateFlag == true) {	// �ߺ� üũ Ȯ���� ���
					if (existPhoneNumber == true) {	// ���� üũ
						setPhoneNumber();
						
						return true;
					} else {	// �ߺ� �� ��ȣ ����
						return false;						
					}
				} else {	// �ߺ� üũ Ȯ������ ���� ���
					if (checkPhoneValidity() == false) {	// �޴��� ��ȣ ��ȣ�� ����
						checkMsg.innerHTML = "�޴��� ��ȣ ���� ���� !";
					} else {
						checkMsg.innerHTML = "��ȣ �ߺ��� üũ���ּ��� !";
					}
				
					return false;
				}
			} else {	// ���
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