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
	<h2>휴대폰 정보 보기</h2>
	<table id="mobilePhoneTable">
		<tbody>
			<tr>
				<td>색인</td>
				<td>${mobilePhone.id }</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${mobilePhone.regDate }</td>
			</tr>
			<tr>
				<td>사용자</td>
				<td>${mobilePhone.customer.name }</td>
			</tr>
			
			<tr>
				<td>휴대폰 번호</td>
				<td>${mobilePhone.phoneNumber }</td>
			</tr>
		</tbody>
	</table>
	<input type="button" value="수정" onClick="clickEvent('수정')" />
	<input type="button" value="해지" onClick="clickEvent('해지')" />
	<input type="button" value="닫기" onClick="clickEvent('닫기')" />
	
	<form name="form" method="post">
		<input type="hidden" name="customerId" value="${mobilePhone.customer.id }" />
		<input type="hidden" name="mobileId" value="${mobilePhone.id }" />
	</form>
	
	<script>
		(function(){	// 즉시실행함수
			opener.parent.location.reload();	// 부모창 새로고침	
		})();
	
		function clickEvent(type) {
			var form = document.form;
			
			if (type == "수정") {
				form.action = "mobilePhoneUpdate.html";
				form.submit();
			} else if (type == "해지") {
				window.opener.name = "parentPage";	// 부모창 이름 설정
				form.target = "parentPage";	// 부모창 타켓으로 설정 
				form.action = "mobilePhoneDelete.html";
				form.submit();
				self.close();
			} else {	// 닫기
				self.close();	// 팝업창 닫기
			}
		}
	</script>
</body>
</html>