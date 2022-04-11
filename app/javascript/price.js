// 金額を入力した数値をpriceInputという変数に格納する
window.addEventListener('load', ()=>{
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // 販売手数料(10%)
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    // 販売利益の計算
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - (inputValue /10));
  })
})