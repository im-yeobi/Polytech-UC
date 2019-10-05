<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<jsp:useBean id="time" class="java.util.Date" />	<!-- ����ð�  -->
<fmt:formatDate value="${time}" var="curTime" pattern="yyyy-MM-dd" />

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
	<h2>�޴��� ���</h2>
	<form name="form" action="mobilePhoneWrite.html" method="post" onSubmit="return clickEvent('���')">
		<table id="mobilePhoneTable">
			<tbody>
				<tr>
					<td>����</td>
					<td>�ű�</td>
				</tr>
				<tr>
					<td>�����</td>
					<td><input type="text" name="regDate" class="telephone-info" value="${curTime }" readonly /></td>
				</tr>
				<tr>
					<td>�����</td>
					<td>
						<input type="text" class="telephone-info" value="${customerName }" readOnly />
						<input type="hidden" name="customerId" value="${customerId }" />
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
						<input type="hidden" name="phoneNumber" />
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="���" />
		<input type="button" value="���" onClick="clickEvent('���')" />
	</form>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var duplicateFlag = false;	// �޴�����ȣ �ߺ� üũ flag
		var existPhoneNumber = false;	// �޴��� ��ȣ ���翩�� üũ, ���� true, �Ұ� false
		var form = document.form;
	
		function clickEvent(type) {
			var checkMsg = document.getElementById('checkMsg');
			
			if (type == "�ߺ�") {
				var checkPhoneNumber = checkPhoneValidity();
				
				if (checkPhoneNumber == true) 
					requestJson();	// �ߺ� üũ ajax
			} else if (type == "���") {
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
						checkMsg.innerHTML = "��ȣ �ߺ� üũ���ּ���.";
					}
				
					return false;
				}
			} else {	// ���
				window.close();
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