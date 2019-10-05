// 아이디 유효성 체크
function checkIdValidity() {
	var id = form.loginId.value;
	var checkId = /^[가-힣a-zA-Z]+$/;	// 한글, 영어만 정규식
	var printNotice = document.getElementById("idNotice");
	
	id = id.replace(/(\s*)/g, "");	// s는 정규표현식에서 공백 의미
	if (id != "") {
		id = form.loginId.value;
		if (checkId.test(id)) {
			return true;
		} else {
			printNotice.innerHTML = "아이디는 한글과 영어만 가능 !";
			return false;
		}
	} else {
		printNotice.innerHTML = "아이디 필수입력 !";
		return false;
	}
}

// 패스워드 유효성 체크
function checkPwdValidity() {
	var pwd = form.loginPwd.value;
	var checkPwd = /^[ㄱ-힣A-Za-z0-9]{6,15}$/;	// 숫자와 문자 포함 형태의 6~15 자리 이내의 암호 정규식
	var printNotice = document.getElementById("pwdNotice");
	
	pwd = pwd.replace(/(\s*)/g, "");
	if (pwd != "") {
		pwd = form.loginPwd.value;
		if (checkPwd.test(pwd)) {
			return true;
		} else {
			printNotice.innerHTML = "숫자와 문자 포함 6~15자리 !";
			return false;
		}
	} else {
		printNotice.innerHTML = "비밀번호 필수 입력 !";
		return false;
	}
}

// 이름 유효성 체크
function checkNameValidity() {
	var name = form.name.value;
	var checkName = /^[가-힣a-zA-Z]+$/; 	// 한글, 영어만 정규식
	var printNotice = document.getElementById("nameNotice");
	
	name = name.replace(/(\s*)/g, "");
	if (name != "") {
		name = form.name.value;
		if (checkName.test(name)) {
			return true;
		} else {
			printNotice.innerHTML = "이름은 한글과 영어만 가능 !";
			return false;
		}
	} else {
		printNotice.innerHTML = "이름 필수 입력 !";
		return false;
	}
}

// 나이 유효성 체크
function checkAgeValidity() {
	var age = form.age.value;
	var checkAge = /^[0-9]{1,3}/;	// 나이 정규식 1~100 사이의 숫자
	var printNotice = document.getElementById("ageNotice");
	
	age = age.replace(/(\s*)/g, "");
	if (age != "") {
		age = form.age.value;
		if (checkAge.test(age) && age >= 1 && age <= 100) {
			return true;
		} else {
			printNotice.innerHTML = "1~100 사이의 수 입력 !";
			return false;
		}
	} else {
		printNotice.innerHTML = "나이 필수 입력 !";
		return false;
	}
}

// 성별 유효성 체크
function checkGenderValidity() {
	var gender = form.gender.value;
	var printNotice = document.getElementById("genderNotice");
	
	if (gender == "") {
		printNotice.innerHTML = "성별 필수 체크 !";
		return false;
	} else {
		return true;
	}
}

// 이메일 유효성 체크
function checkEmailValidity() {
	var email = form.email.value;
	var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var printNotice = document.getElementById("emailNotice");

	email = email.replace(/(\s*)/g, "");
	if (email != "") {
		email = form.email.value;
		if (checkEmail.test(email)) {
			return true;
		} else {
			printNotice.innerHTML = "이메일 형식에 맞게 입력 !";
			return false;
		}
	} else {
		printNotice.innerHTML = "이메일 필수 입력 !";
		return false;
	}
}

function setPrintNotice(type) {
	var printNotice = document.getElementById(type + "Notice");
	printNotice.innerHTML = "";
}