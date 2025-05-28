const currentTime = () => {
  const weels = ["일", "월", "화", "수", "목", "금", "토"];
  const today = new Date();
  console.log(today);
  console.log(today.getFullYear()); //년
  console.log(today.getMonth() + 1); //월 (0 : 1월, 1 : 2월)
  console.log(today.getDate()); //일
  console.log(today.getDay()); //요일 (0:일, 1 : 월)
  console.log(weels[today.getDay()]);
  const year = today.getFullYear();
  const month = today.getMonth() + 1;
  const day = today.getDate();
  const week = weels[today.getDay()];

  const current = document.querySelector("#current");
  console.log(current);
  current.innerHTML = `${year}년 ${month}월 ${day}일 (${week})`;

  const h1 = document.querySelector("h1");
  console.log(today.getHours()); //시
  console.log(today.getMinutes()); //분
  console.log(today.getSeconds()); //초
  const hour = today.getHours();
  const minute = today.getMinutes();
  const second = String(today.getSeconds()).padStart(2, "0");

  h1.textContent = `${hour}:${minute}:${second}`;
};

const randomBackground = () => {
  const body = document.body;
  const r = Math.floor(Math.random() * 256); // 0 <= random < 256
  const g = Math.floor(Math.random() * 256);
  const b = Math.floor(Math.random() * 256);
  const backGround = [
    "#ED833A",
    "#EA839B",
    "#42B667",
    "#FFC228",
    "#005456",
    "#ACDED5",
  ];

  body.style.background =
    backGround[Math.floor(Math.random() * backGround.length)];
};

//body.style.background = `rgba(${r}${g}${b},0.4)`;
// }

const count = () => {
  const last = new Date("2026-01-01 00:00:00"); //목표하는 날짜.
  const now = new Date();
  const second = Math.floor((last - now) / 1000); // 1초 = 밀리세컨드/1000
  const minte = Math.floor(second / 60); // 60초 = 1분
  const hour = Math.floor(minte / 60); // 60분 = 1시간
  const day = Math.floor(hour / 24); //24시간 = 1일
  console.log(day);
  console.log(hour % 24);
  console.log(minte % 60);
  console.log(second % 60);
  const count = document.querySelector("#count");
  count.innerHTML = `올해 남은 시간 ${day}일 ${hour % 24}시간 ${minte % 60}분 ${
    second % 60
  }초`;
};

import quotes from "./quotes.js";

const randomQuote = () => {
  const random = quotes[Math.floor(Math.random() * quotes.length)];
  // console.log(quotes[0].en);
  // console.log(quotes[0].ko);

  const quoteE = document.querySelector("#quoteE");
  const quoteK = document.querySelector("#quoteK");
  // console.log(random.en);
  // console.log(random.ko);

  console.log(random);
  quoteE.innerHTML = random.en;
  quoteK.innerHTML = random.ko;
};

currentTime();
randomBackground();
count();
randomQuote();

setInterval(() => {
  currentTime();
  count();
}, 1000); //1000 1초

setInterval(() => {
  randomBackground();
  randomQuote();
}, 5000);
