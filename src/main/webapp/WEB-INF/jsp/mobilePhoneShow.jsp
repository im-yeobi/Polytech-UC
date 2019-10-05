<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</style>
</head>
<body>
	<h2>�޴��� ���� ����</h2>
	<table id="mobilePhoneTable">
		<tbody>
			<tr>
				<td>����</td>
				<td>${mobilePhone.id }</td>
			</tr>
			<tr>
				<td>�����</td>
				<td>${mobilePhone.regDate }</td>
			</tr>
			<tr>
				<td>�����</td>
				<td>${mobilePhone.customer.name }</td>
			</tr>
			
			<tr>
				<td>�޴��� ��ȣ</td>
				<td>${mobilePhone.phoneNumber }</td>
			</tr>
		</tbody>
	</table>
	<input type="button" value="����" onClick="clickEvent('����')" />
	<input type="button" value="����" onClick="clickEvent('����')" />
	<input type="button" value="�ݱ�" onClick="clickEvent('�ݱ�')" />
	
	<form name="form" method="post">
		<input type="hidden" name="customerId" value="${mobilePhone.customer.id }" />
		<input type="hidden" name="mobileId" value="${mobilePhone.id }" />
	</form>
	
	<script>
		(function(){	// ��ý����Լ�
			opener.parent.location.reload();	// �θ�â ���ΰ�ħ	
		})();
	
		function clickEvent(type) {
			var form = document.form;
			
			if (type == "����") {
				form.action = "mobilePhoneUpdate.html";
				form.submit();
			} else if (type == "����") {
				window.opener.name = "parentPage";	// �θ�â �̸� ����
				form.target = "parentPage";	// �θ�â Ÿ������ ���� 
				form.action = "mobilePhoneDelete.html";
				form.submit();
				self.close();
			} else {	// �ݱ�
				self.close();	// �˾�â �ݱ�
			}
		}
	</script>
</body>
</html>