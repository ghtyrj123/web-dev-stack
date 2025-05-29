const id = document.querySelector("#id");
const pw = document.querySelector("#pw");
const newpw = document.querySelector("#newpw");
const named = document.querySelector("#named");
const email = document.querySelector("#email");
const coll = document.querySelector("#coll");
const p1 = document.querySelector("#p1");
const p2 = document.querySelector("#p2");
const p3 = document.querySelector("#p3");
const p4 = document.querySelector("#p4");
const p5 = document.querySelector("#p5");
const p6 = document.querySelector("#p6");

id.addEventListener("input", (e) => {
  let idok = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;
  if (idok.test(e.target.value)) {
    p1.innerHTML = "사용할 수 있는 아이디 입니다.!";
    p1.style.color = "green";
  } else {
    p1.innerHTML = "다시 입력해주시오!";
    p1.style.color = "red";
  }
});

pw.addEventListener("input", (e) => {
  let pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,15}$/;

  if (pwd.test(e.target.value)) {
    p2.innerHTML = "사용가능한 비밀번호 입니다!";
    p2.style.color = "green";
  } else {
    p2.innerHTML = "사용불가한 비밀번호 입니다.";
    p2.style.color = "red";
  }
});

named.addEventListener("input", (e) => {
  let yname = /^[가-힣]{2,}$/;
  if (yname.test(e.target.value)) {
    p4.innerHTML = "사용 가능한 이름입니다";
    p4.style.color = "green";
  } else {
    p4.innerHTML = "한글을 사용하여 이름을 지어주세요";
    p4.style.color = "red";
  }
});

email.addEventListener("input", (e) => {
  let emaild = /^[\w.-]+@[\w.-]+\.[A-Za-z]{2,}$/;
  if (emaild.test(e.target.value)) {
    p5.innerHTML = "사용 가능한 이메일입니다";
    p5.style.color = "green";
  } else {
    p5.innerHTML = "이메일 형식에 맞게 지어주세요";
    p5.style.color = "red";
  }
});

coll.addEventListener("input", (e) => {
  let colld = /^010-\d{4}-\d{4}$/;
  if (colld.test(e.target.value)) {
    p6.innerHTML = "사용 가능한 전화번호입니다.";
    p6.style.color = "green";
  } else {
    p6.innerHTML = "올바른 전화번호를 적어주세요";
    p6.style.color = "red";
  }
});

const button2 = document.querySelector("#button2");
const input = document.querySelector("input");
button2.addEventListener("click", () => {
  input.textContent = "";
});
