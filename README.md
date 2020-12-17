# アプリケーション名
seven_habits

# アプリケーションの概要
ユーザーの診断 7つの習慣を元に実践できているか診断できます。
積立複利計算 つみたてNISAなどの非課税の投資を運用したシュミレーションができます。

# URL
https://seven-habits.herokuapp.com/

# 利用方法
ユーザー診断
1 トップページから「診断する」をクリックします。
2 全14問Yes,Noで答えます。
3 答えた結果により判定され診断結果を読むことができます。

積立複利計算
1 トップページから「発見しにいく」をクリックします。
2 始めるの資金額を元金に半角数字で入力します。
3 毎月積み立てる金額を毎月積立額に半角数字で入力します。
4 年利を選択してください。
5 積み立てる年数選択してください。
6 「計算をする」をクリックすることで結果をみることができます。

# 目指した課題解決
アプリ開発者が人に伝えたいことをアプリで補うためです。
ユーザーに7つの習慣や資産運用の関心をもってもらうことです。

# 洗い出した要件

| 優先順位 (高：3、中：2、低：1) | 機能            | 目的                                                  | 詳細                                                 | ユーザーユース                                        | 見積もり |
| ------------------ | ------------- | ----------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | ------ |
|                  3 | 診断機能        | ユーザーの回答により診断される                            | 14問2択で回答したら診断結果別にページ遷移する               | 簡単に診断してもらうためにログイン機能は実装しない<br>4種類の結果を区別するため14問必要 | 40 |
|                  3 | 計算結果表示機能 | ユーザーに複利の力を理解してもらう                         | フォームで元金、積立額、年利、年数を入力し複利計算され出力する | 全ての値が入力されない場合は計算されない<br>値の入力に悩まないよう年利率と年数はアクティブハッシュを用いる<br>計算出力後のshowページを別のユーザーが閲覧できないようにする | 30     |
|                  3 | 計算結果表示機能 | ユーザーに計算結果をグラフで見やすく理解してもらう            | 計算結果をグラフ描画する                                 | 計算結果の値をグラフに表示する<br>計算の過程を文字で表示する  | 20     |
|                  2 | 計算補助機能    | 値入力に悩んだユーザーに向けて現実的な値を自動入力             | ボタンをクリックしたらフォームに値を自動入力する             | ボタンをクリックすると値が自動入力され<br>ボタンをクリックしたら値が削除される | 5      |
|                  1 | 計算補助機能2   | ユーザーに複利という力をより簡単に体験してもらうため値を自動入力 | ボタンをクリックしたら自動で計算結果を表示する               | ボタンをクリックするとフォームに値が自動入力され<br>フォーム送信も自動クリックされる | 2      |

# テーブル設計

## sevens テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| principal       | integer    | null: false                    |
| deposit         | integer    | null: false                    |
| annual_yield_id | integer    | null: false                    |
| years_id        | integer    | null: false                    |
