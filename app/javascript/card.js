// トークン化を行うファイル
const pay = () => {
  Payjp.setPublicKey("pk_test_8d25ab137cb16f4b840c8df7"); //PAY.JPのテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // クレジットカードに関する情報を取得
    const card = {
      number: formData.get("order_destination[number]"),
      exp_month: formData.get("order_destination[exp_month]"),
      exp_year: `20${formData.get("order_destination[exp_year]")}`,
      cvc: formData.get("order_destination[cvc]"),
    };
    console.log(card);
    // カード情報のトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
      }
        // クレジットカード情報の削除
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        // フォームの情報をサーバーサイドに送信
        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);