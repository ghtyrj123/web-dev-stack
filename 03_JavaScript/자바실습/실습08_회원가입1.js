const userId = document.querySelector("#userId");
const userRegExp = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;
const userSpan = document.querySelector("#userId+span");
userId.addEventListener("input", (e) => {
  if (userRegExp.test(e.target.value)) {
    userSpan.innerHTML = "Ok!";
    userSpan.style.color = "green";
  } else if (e.target.value === "") {
    userSpan.innerHTML = "영문자를 시작하고 영문자와 숫자 조합으로 4~12자 이내";
    userSpan.style.color = "black";
  } else {
    userSpan.innerHTML =
      "영문자로 시작하고 영문자와 숫자 조합으로 4 ~ 12자 이내";
    userSpan.style.color = "red";
  }
});
const password = document.querySelector("#password");
const passwordRegExp =
  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,15}$/;
const passwordSpan = document.querySelector("#password+span");
password.addEventListener("input", (e) => {
  if (passwordRegExp.test(e.target.value)) {
    passwordSpan.innerHTML = "Ok!";
    passwordSpan.style.color = "green";
  } else if (e.target.value === "") {
    passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8 ~ 15자 이내";
    passwordSpan.style.color = "black";
  } else {
    passwordSpan.innerHTML = "영문자, 숫자, 특수문자 조합으로 8 ~ 15자 이내";
    passwordSpan.style.color = "red";
  }
  if (e.target.value !== "" && e.target.value !== passwordCheck.value) {
    passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
    passwordCheckSpan.style.color = "red";

    if (passwordCheck.value === e.target.value) {
      passwordCheckSpan.innerHTML = "ok!";
      passwordCheckSpan.style.color = "green";
    }
  }
});

const passwordCheck = document.querySelector("#passwordCheck");

const passwordCheckSpan = document.querySelector("#passwordChack+span");
passwordCheck.addEventListener("input", (e) => {
  if (
    passwordRegExp.test(password.value) &&
    password.value === e.target.value
  ) {
    if (passwordCheck.value === e.target.value)
      passwordCheckSpan.innerHTML = "Ok!";
    passwordCheckSpan.style.color = "green";
  } else {
    passwordCheckSpan.innerHTML = "위 비밀번호와 동일하게";
    passwordCheckSpan.style.color = "red";
  }
});

const userName = document.querySelector("#userName");
const userNameRegExp = /^[가-힣]{2,}$/;

const userNameSpan = document.querySelector("#userName+span");
userName.addEventListener("input", (e) => {
  if (userNameRegExp.test(e.target.value)) {
    userNameSpan.innerHTML = "Ok!";
  } else {
    userNameSpan.innerHTML =
      "영문자로 시작하고 영문자와 숫자 조합으로 4 ~ 12자 이내";
  }
});
