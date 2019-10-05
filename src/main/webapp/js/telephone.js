// ajax 통신 (중복체크)
function requestJson() {
	var start = form.phoneS.value;
	var middel = form.phoneM.value;
	var end = form.phoneE.value;
	
	var phoneNumber = start + "-" + middel + "-" + end;
	
	var checkMsg = document.getElementById('checkMsg');
				
	$.ajax({	// 중복체크 비동기 통신
		url: "api/mobilePhone/json/",
		type: "POST",
		data: {'phoneNumber' : phoneNumber},
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json",
		success: function(json) {
			if (json == true) {	// 존재하면 true
				checkMsg.innerHTML = "이미 존재하는 번호입니다.";
				existPhoneNumber = false;
			} else {	// 존재하지 않으면 false
				checkMsg.innerHTML = "중복 체크 완료 !";
				existPhoneNumber = true;
			}
			duplicateFlag = true;
		},
		error: function() {
			alert("ajax error!");
		}
	});
}

// 휴대폰번호 유효성 체크
function checkPhoneValidity() {
	var middle = form.phoneM.value;
	var end = form.phoneE.value;
	var checkNumber = /^[0-9]{4}/;
	var checkMsg = document.getElementById('checkMsg');
	
	if ( checkNumber.test(middle) && checkNumber.test(end) ) {
		return true;
	} else {
		checkMsg.innerHTML = "휴대폰 번호 형식 오류 !";
		return false;
	}
}

function setPhoneNumber() {
	var start = form.phoneS.value;
	var middle = form.phoneM.value;
	var end = form.phoneE.value;
	
	form.phoneNumber.value = start + "-" + middle + "-" + end;
}