// 코드 중복1 함수로 기능으로
const show = (info) => {
  document.body.innerHTML = `
    <h1>${info}님 환영합니다!<h1>
    <button type="button" id="logout">로그아웃</button>
     
  `;
};

//로그인 되어 있는 건지 아닌지 상태 확인
const info = localStorage.setItem("name");
if (info) {
  document.body.innerHTML = `
    <h1>${info}님 환영합니다!<h1>
    <button type="button" id="logout">로그아웃</button>
     
  `;
  const logout = document.querySelector("#loglout");
  logout.addEventListener("click", () => {
    localStorage.removeItem("name");
    location.reload();
  });
}

login.addEventListener("click", () => {
  //아이디 입력하고 비밀번호 입력받은 값을 로그인 처리
  // 로그인 성공 후 이름을 저장 보이게
  if (username.value === "" && password === "") {
    alert("이름과 비밀번호를 입력해주세용");
    return;
  }
  localStorage.setItem("name", userName.value);
  // ~님환영합니다! 로그아웃 버튼
  show(username.value);
});
