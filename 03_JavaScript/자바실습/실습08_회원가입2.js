const signup = document.querySelector("#signup");
let chack1 = false; //userId
let chack2 = false; //passWord
let chack3 = false; //passWordCheck
let chack4 = false; //userName
let chack5 = false; //email
let chack6 = false; //phone

const userId = document.querySelector("#userId");
const userSpan = document.querySelector("#userId+span");
const userRegExp = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;

userId.addEventListener("input", (e) => {
  if (userRegExp.test(e.target.value)) {
    userSpan.innerHTML = "OK!";
    userSpan.style.color = "green";
    chack1 = true;
  } else if (e.target.value === "") {
    userSpan.innerHTML = "영문자로 시작하고 영문자와 숫자 조합으로 4~12자 이내";
    userSpan.style.color = "black";
    chack1 = false;
  } else {
    userSpan.innerHTML = "영문자로 시작하고 영문자와 숫자 조합으로 4~12자 이내";
    userSpan.style.color = "red";
    check1 = false;
  }

  /* if(chack1 && chack2 && chack3 && chack4 && chack5 && chack6 ) { //전부 트루인경우
    signup.disabled = false;  //이것을 실행 */
  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});

const password = document.querySelector("#password");
const passwordSpan = document.querySelector("#password+span");
const passwordCheck = document.querySelector("#passwordCheck");
const passwordCheckSpan = document.querySelector("#passwordCheck+span");

const passRegExp =
  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,15}$/;
password.addEventListener("input", (e) => {
  if (passRegExp.test(e.target.value)) {
    passwordSpan.innerHTML = "OK!";
    passwordSpan.style.color = "green";
    chack2 = true;
  } else if (e.target.value === "") {
    passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8~15자 이내";
    passwordSpan.style.color = "black";
    chack2 = false;
  } else {
    passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8~15자 이내";
    passwordSpan.style.color = "red";
    chack2 = false;
  }

  if (passwordCheck.value === e.target.value) {
    passwordCheckSpan.innerHTML = "OK";
    passwordCheckSpan.style.color = "green";
    chack3 = true;
  } else {
    passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
    passwordCheckSpan.style.color = "red";
    chack3 = false;
  }
  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});

passwordCheck.addEventListener("input", (e) => {
  if (passRegExp.test(password.value) && password.value === e.target.value) {
    passwordCheckSpan.innerHTML = "OK!";
    passwordCheckSpan.style.color = "green";
    chack3 = true;
  } else if (e.target.value === "") {
    passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
    passwordCheckSpan.style.color = "black";
    chack3 = false;
  } else {
    passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
    passwordCheckSpan.style.color = "red";
    chack3 = false;
  }

  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});

const userName = document.querySelector("#userName");
const userNameSpan = document.querySelector("#userName+span");
const userNameRegExp = /^[가-힣]{2,}$/;
userName.addEventListener("input", (e) => {
  if (userNameRegExp.test(e.target.value)) {
    userNameSpan.innerHTML = "OK!";
    userNameSpan.style.color = "green";
    chack4 = true;
  } else if (e.target.value === "") {
    userNameSpan.innerHTML = "한글 2자 이상";
    userNameSpan.style.color = "black";
    chack4 = false;
  } else {
    userNameSpan.innerHTML = "한글 2자 이상";
    userNameSpan.style.color = "red";
    chack4 = false;
  }
  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});

const email = document.querySelector("#email ");
const emailSpan = document.querySelector("#email+span");
const emailRegExp = /^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$/;
email.addEventListener("input", (e) => {
  if (emailRegExp.test(e.target.value)) {
    emailSpan.innerHTML = "OK!";
    emailSpan.style.color = "green";
    chack5 = true;
  } else if (e.target.value === "") {
    emailSpan.innerHTML = "이메일 형식";
    emailSpan.style.color = "black";
    chack5 = false;
  } else {
    emailSpan.innerHTML = "이메일 형식";
    emailSpan.style.color = "red";
    chack5 = false;
  }
  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});

const phone = document.querySelector("#phone ");
const phoneSpan = document.querySelector("#phone + span");
const phoneRegExp = /^010-\d{4}-\d{4}$/;

phone.addEventListener("input", (e) => {
  if (phoneRegExp.test(e.target.value)) {
    phoneSpan.innerHTML = "OK!";
    phoneSpan.style.color = "green";
    chack6 = true;
  } else if (e.target.value === "") {
    phoneSpan.innerHTML = "전화번호 형식";
    phoneSpan.style.color = "black";
    chack6 = false;
  } else {
    phoneSpan.innerHTML = "전화번호 형식";
    phoneSpan.style.color = "red";
    chack6 = false;
  }
  signup.disabled = !(chack1 && chack2 && chack3 && chack4 && chack5 && chack6);
});
/*
const cencel = document.querySelector("#cencel");
cencel.addEventListener("click ", () => {
  userSpan.innerHTML = "영문자로 시작하고 영문자와 숫자 조합으로 4~12자 이내";
  userSpan.style.color = "black";
  passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8~15자 이내";
  passwordSpan.style.color = "black";
  passwordCheck.innerHTML = "위 비밀번호와 동일하게";
  passwordCheckSpan.style.color = "black";
  userNameSpan.innerHTML = "한글 2자 이상";
  userNameSpan.style.color = "black";
  emailSpan.innerHTML = "이메일 형식";
  emailSpan.style.color = "black";
  phoneSpan.innerHTML = "전화번호 형식";
  phoneSpan.style.color = "black";
});
*/

const cancel = document.querySelector("#cancel");
cancel.addEventListener("click", () => {
  userSpan.innerHTML = "영문자로 시작하고 영문자와 숫자 조합으로 4~12자 이내";
  userSpan.style.color = "black";
  passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8~15자 이내";
  passwordSpan.style.color = "black";
  passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
  passwordCheckSpan.style.color = "black";
  userNameSpan.innerHTML = "한글 2자 이상";
  userNameSpan.style.color = "black";
  emailSpan.innerHTML = "이메일 형식";
  emailSpan.style.color = "black";
  phoneSpan.innerHTML = "전화번호 형식";
  phoneSpan.style.color = "black";
});
