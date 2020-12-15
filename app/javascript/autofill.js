function autofill (){
  const autoBtn = document.getElementById('autobtn');
  const autoBtn2 = document.getElementById('autobtn2');
  const obj = document.getElementById('open').style;
  const calc = document.getElementsByClassName('form__btn');
  const principal = document.getElementById( "principal" );
  const deposit = document.getElementById( "deposit" );
  const annual = document.getElementById( "annual" );
  const years = document.getElementById( "years" );
  

  autoBtn.addEventListener('click', function() {
    principal.value = "0" ;
    deposit.value = "33333" ;
    annual.value = "5" ;
    years.value = "17" ;
    obj.display = (obj.display=='none')?'block':'none';
    if (autoBtn.textContent == "入力に迷ったときはこちら") {
      autoBtn.textContent = "自分で入力する場合はこちら"
    } else {
      principal.value = "" ;
      deposit.value = "" ;
      annual.value = "0" ;
      years.value = "0" ;
      autoBtn.textContent = "入力に迷ったときはこちら"
    }
  });
  
  autoBtn2.addEventListener('click',function() {
    principal.value = "0" ;
    deposit.value = "1000" ;
    annual.value = "23" ;
    years.value = "50" ;
    calc[0].click();
  })
};

window.addEventListener('load', autofill);