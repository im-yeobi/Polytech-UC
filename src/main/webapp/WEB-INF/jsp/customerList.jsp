<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer</title>
<style>
	body {
        padding-left: 50px;
        padding-top: 20px;
    }
    #customerTable {
        border-collapse: collapse;
        font-size: 16px;
    }
    #customerTable th {
        height: 40px;
        background-color: #2E9AFE;
        border: 1px solid lightgray;
        color: white;
        font-size: 17px;
    }
    #customerTable td {
    	height: 30px;
        border: 1px solid lightgray;
    	font-size: 17px;
    }
    h2 {
    	display: inline;
    }
    .search {
		margin-left: 480px;
		margin-bottom: 20px;
    }
</style>
</head>
<body>
	<h2>고객 정보</h2>
	<div class="search">
		<form name="searchForm" method="post" onSubmit="searchEvent()">
			<select name="searchType" style="height:23px;">
				<option value="name" ${(searchType == "name")? "selected" : "" } >사용자 이름</option>
				<option value="phone" ${(searchType == "phone")? "selected" : "" }>휴대폰 번호</option>
			</select>
			<input type="text" name="nameOrPhone" value="${nameOrPhone }" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<form name="form" action="customerSelectDelete.html" method="post">
	    <table id="customerTable">
	        <thead>
	            <tr>
	            	<th width="40px"></th>
	                <th width="40px">색인</th>
	                <th width="130px">아이디</th>
	                <th width="150px">이름</th>
	                <th width="80px">나이</th>
	                <th width="80px">성별</th>
	                <th width="250px">이메일</th>
	            </tr>
	        </thead>
	        <tbody align="center">
	        <c:choose>
		        <c:when test="${customers.size() == 0 && nameOrPhone != '' }">
		        	<tr>
		        		<td colspan="7" style="font-weight: bold;">검색된 사용자가 없습니다.</td>
		        	</tr>
		        </c:when>
		        <c:when test="${customers.size() == 0 }">
		        	<tr>
		        		<td colspan="7" style="font-weight: bold;">사용자를 등록해주세요.</td>
		        	</tr>
		        </c:when>
	        </c:choose>
	        <c:forEach items="${customers }" var="customer">
	            <tr>
	            	<td>
	           			<input type="checkbox" name=delCheck value="${customer.id }" />
	            	</td>
	                <td>${customer.id }</td>
	                <td>${customer.loginId }</td>
	                <td><a href="customerShow.html?id=${customer.id }">${customer.name }</a></td>
	                <td>${customer.age }</td>
	                <c:choose>
		                <c:when test="${customer.gender == 'M' }">
		                	<td>남</td>
		                </c:when>
		                <c:otherwise>
		                	<td>여</td>
		                </c:otherwise>
	                </c:choose>
	                <td>${customer.email }</td>
	            </tr>
	        </c:forEach>
	        </tbody>
	    </table>
    	<input type="hidden" name="delUserId" />
    </form>
    <c:if test="${nameOrPhone != '' }" >
    	<input type="button" id="insertBtn" value="전체 보기" onClick="clickEvent('전체')" />	<!-- 검색창에서만 전체 보기 버튼 표시 -->
	</c:if>
    	<input type="button" id="insertBtn" value="신규" onClick="clickEvent('신규')" />
    <c:if test="${customers.size() != 0 }">
    	<input type="button" id="insertBtn" value="선택 삭제" onClick="clickEvent('삭제')" />
    </c:if>
    
	<script>
		function clickEvent(type) {	// 신규, 삭제 버튼 클릭 이벤트
			if (type == "전체") {	// 전체 보기
				window.location = "customerList.html";
			} else if (type == "신규") {	// 신규 
				window.location = "customerInsert.html";
			} else if (type == "삭제") {	// 선택 삭제
				var form = document.form;
			
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
					form.delUserId.value = checkId;
					form.submit();
				}
			}
		}
		
		function searchEvent() {
			var form = document.searchForm;
			var type = form.searchType.value;
			
			if (type == "name") {
				form.action = "customerSearch.html";
			} else {
				form.action = "mobilePhoneSearch.html";
			}
		}
	</script>    
</body>
</html>