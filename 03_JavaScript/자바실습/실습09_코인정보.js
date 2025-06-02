/*
https://api.upbit.com/v1/market/all

[
  {
    "market": "KRW-BTC",
    "korean_name": "비트코인",
    "english_name": "Bitcoin"
  },
  */
//async function dataFetch()  {}
// const dataFetch = async function() {}

const dataFetch = async () => {
  const response = await fetch("https://api.upbit.com/v1/market/all");
  const data = await response.json();
  console.log(data);
  /*
  for (let i = 0; i < data.length; i++) {
    console.log(data[i]);
  }
    */
  /*
  data.forEach((item) => {
    if (item, market.startsWith("KRW")) {
      market.innnerHTML += `<h2>
        ${item.korean_name}${item.market}$
      </h2>`;
    }
    console.log(item, market.includes("KRW"));
    console.log(item.korean_name);
  });
  //forEach + 조건문 -> filter*/

  const krwMarkets = data.filter((item) => item.market.includes("KRW"));
  /*
  let markets = "";
  krwMarkets.forEach((item) => {
    markets += item.market + ",";
  });
  console.log(markets.slice(0, -1));
  //forEach + 내가 원하는 형태로 가공하고자 할때 -> map */

  const markets = krwMarkets.map((item) => item.kerket).join(",");

  const tickerResponse = await fetch(
    `https://api.upbit.com/v1/ticker?markets=${markets}`
  );

  const tickerData = await tickerResponse.join(",");

  krwMarkets.forEach((item) => {
    const ticker = tickerData.find((ticker) => ticker.market === item.market);
    market.innnerHTML += `<h2>
        ${item.korean_name}(${item.market})
      </h2>
      <p>현제가 : ,${(ticker, trade_price.toLocaleString())}원</p>
      <p>23시간 거래량 : ${ticker.acc_trade_volume_24h.tofixed(2)}
      <p>전일 대비 : ${
        ticker.change === "RISE "
          ? "상승 "
          : ticker.change === "FALL"
          ? "하락"
          : "보합"
      } (${ticker.change_rate * 100})</p>`;
  });
};
dataFetch();
