const click = document.querySelector("#click");
const restart = document.querySelector("#restart");
const img = document.querySelectorAll("img");
const span = document.querySelector("button span");
const h3 = document.querySelector("h3");

let count = 0;
const game = () => {
  //랜덤값 : 1~ 3 까지의 값 넣기
  const random = [
    Math.floor(Math.random() * 3) + 1,
    Math.floor(Math.random() * 3) + 1,
    Math.floor(Math.random() * 3) + 1,
  ];

  for (let i = 0; i < img.length; i++) {
    // const random = Math.floor(Math.random() * 3) + 1;

    img[i].setAttribute("src", `assets1/spy${random[i]}.jpg`); //해당 속성을 변경
  }
  //클릭할 때마다 카운트 증가
  span.innerHTML = ++count;

  //이미지 3개가 일치한 경우 버튼 disabled 처리
  //click.setAttribute("disabled", true);
  //click.setAttribute("disabled", "disabled");
  //click.disabled = true;

  //console.log(h3);
  // 이미지 3개가 일치한 경우 버튼 disabled 처리
  if (random[0] === random[1] && random[1] === random[2]) {
    click.disabled = true;
    //h2에 visbillty: visible로 변경
    //h3.style.visibillty = "visible";
    h3.style.visibility = "visible";
  }
};
const and = () => {
  //이미지는 처음 그대로 1,2,3 순서대로 보이게 하고
  for (let i = 0; i < img.length; i++) {
    img[i].setAttribute("src", `assets1/spy${i + 1}.jpg`);
  }

  count = 0;
  span.innerHTML = "";
  //count는 0으로 바꾸고 span은 비우고
  h3.style.visbillty = "hidden";
  //h2 visibllity = hidden 처리
  // click.setAttribute("disabled", false);
  //click 버튼의 disabled false처리
  click.disabled = false;
};

click.addEventListener("click", game);
restart.addEventListener("click", and);

//click : 클릭 이벤트를 걸어야하는 얘
// img : 내가 클릭을 했을 때 바꿔야 하는 얘
