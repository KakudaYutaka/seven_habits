'use strict';
function seven (){
  const question = document.getElementById('question');
  const choices = document.getElementById('choices');
  const btn = document.getElementById('btn');
  const result = document.getElementById('result'); //リザルト
  const scoreLabel = document.querySelector('#result > p'); //リザルトのpの位置を代入
  const submit = document.getElementById("submit")
  // const count=document.getElementById("count");
  // setInterval(function(){count.innerHTML--;},1000);
  // setTimeout(function(){location.href="/sevens/ninety";},5000);

  const quizSet = shuffle([ //問題をシャッフル
    {q: '常識や「空気を読むこと」を意識しすぎた行動が多い', c: ['Yes', 'No']},
    {q: '思い通りにいかなくてイライラすることが多い', c: ['Yes', 'No']},
    {q: '仕事やトレーニング、家事や買い物など、段取りを考えずに始めることが多い', c: ['Yes', 'No']},
    {q: '今の自分の仕事や状況に、やりがいや目的を見出せていない', c: ['Yes', 'No']},
    {q: '時間がなくて、やりたいことが後回しになっていると感じる', c: ['Yes', 'No']},
    {q: '家にいるときは、何となくテレビをつけている', c: ['Yes', 'No']},
    {q: '結局、人生は競争で、強者が勝つのが真理だと思う', c: ['Yes', 'No']},
    {q: '成功のためには、誰かを蹴落とすことも仕方がないと思う', c: ['Yes', 'No']},
    {q: '人の話を途中で遮って意見を言ってしまうことが多い', c: ['Yes', 'No']},
    {q: '会話が「でも」「だけど」で始まっていることが多い', c: ['Yes', 'No']},
    {q: '交渉とは、妥協点を探し、相手の譲歩を引き出す作業のことだと思う', c: ['Yes', 'No']},
    {q: '考え方やタイプが似ている人といたほうが楽しい', c: ['Yes', 'No']},
    {q: 'まんがは読むが、活字の本は1年で5冊も読まない', c: ['Yes', 'No']},
    {q: '定期的な運動は特にしていない', c: ['Yes', 'No']},
  ]);
  let currentNum = 0;
  let isAnswered;
  let score = 0; //正答数管理数値
  
  // const start = document.getElementById('start');

  // // HTMLElement.click()を使う場合
  // function startTest () {
  //     start.click();
  //     console.log('Start!');
  // }
  // startTest();



  function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--) { // i が 0 より大きい間 i を 1 ずつ減らしながら処理してあげる
      const j = Math.floor(Math.random() * (i + 1)); //ランダムに選ぶ範囲の終点のインデックスがi、0 から i 番目のランダムな整数値を生成
      [arr[j], arr[i]] = [arr[i], arr[j]]; //分割代入
    }
    return arr;
  }

  function checkAnswer(li) {
    if (isAnswered === true) {
      return;
    }
    isAnswered = true;


    if (li.textContent === quizSet[currentNum].c[0]) {
      li.classList.add('yes');
      score++; //スコアを足す
    } else {
      li.classList.add('no');
    }

    btn.classList.remove('disabled'); //nextボタンの色が変わる
  }

  function setQuiz() {
    isAnswered = false;
    question.textContent = quizSet[currentNum].q;

    while (choices.firstChild) {                //choices の最初の子要素がある限り choices の最初の子要素を消す、
      choices.removeChild(choices.firstChild);  //whileは() の中に単一のオブジェクトを入れる場合、false や null でない限り{} （ブロック）の中の処理をくり返す
    }                                           //choices.firstChild の値が null になるまでループが回って結果的に choices の子要素が全て消える。

    const quizSets = ([...quizSet[currentNum].c]); //YesNo繰り返し
    quizSets.forEach(choice => {
      const li = document.createElement('li');
      li.textContent = choice;
      li.addEventListener('click', () => {
        checkAnswer(li);
      });
      choices.appendChild(li);
    });

  }

  setQuiz();

  btn.addEventListener('click', () => { //ネクストボタンクリック次の問題
    if (btn.classList.contains('disabled')) {
      return;
    }
    btn.classList.add('disabled');

    if (currentNum === quizSet.length - 1) { // 問題を終えた時の処理 行った回数から問題の数は0からなので-1引いている
      scoreLabel.textContent = `おつかれさまでした。`; //あとで改行とスコアを消すこと htmlのp要素に追加 
      result.classList.remove('hidden'); //リザルトのクラスhiddenを外す
        if (score <= 3) {
          submit.href = "/sevens/ninety"
        } else if (score <= 7) {
          submit.href = "/sevens/sixty"
        } else if (score <= 12) {
          submit.href = "/sevens/thirty"
        }else {
          submit.href = "/sevens/ten"
        }
    } else{
      currentNum++;
      setQuiz();
    }
  });
}

window.addEventListener('load', seven);