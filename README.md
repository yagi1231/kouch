# 情報共有サイト　アプリ名『kouch-bento』
このアプリは私が働いている「デリバリー専門店　KOUCH」というお店のデリバリー店員に向けて作ったものです。
デリバリー店員は配達が基本業務なので基本的にお店にいることは少なく忙しくなればなるほど一回で配達する件数も必然的に増えていきます。
そうなるとその日いるメンバー(平均4.5人)で時間に合わせるように効率が求められます。
そこで使用するのがこの情報共有アプリです。
金額を打ち込めば日別、月別での売り上げ表示が可能です。

<img width="1678" alt="100000" src="https://user-images.githubusercontent.com/77727362/143256417-5da9d9f2-a6b9-43ce-bb8e-d94925c46555.png">

#　大戸屋とkouchの関係性
このアプリを紹介するにはこの二つの店の関係性を説明しなくてはいけない。
kouchは大戸屋所沢プロペ通り店をフランチャイズしたオーナーが１から新しい事業として始めたものです。
大戸屋でも店内とは別にデリバリー事業は行っている。
お店の場所も2,300mの場所にあるため配達員は4,5人で二つの店を行き来し配達を行っている。

# 使い方
テストログイン  　　
Eメール「potepan@gmail.com」  　　
password「potepan」  　　

1、ログインを行う  
2,電話がかかってきたらンバーガーメニューの「顧客一覧」を選択    　　
3,お客様にkouchの注文は初めてか確認。初めてなら新規登録、２回目以降なら電話番号を伺う      　　
4,新規登録、または検索を行い詳細ページ中にある「新規注文画面へ」を選択。      　　
5,https://kouch-bento.herokuapp.com/reservations/new に移行したら、残りの注文内容、金額、カテゴリー、企業、民家を打ち込みし「登録完了する」を選択     　　
6,後は、https://kouch-bento.herokuapp.com/reservations に時間順に表示されているので住所や時間、大戸屋とのコラボなどを確認することができる     　　

またログインは社員さんや限られた人にのみ教えるつもりなのでそれ以外の人は
https://kouch-bento.herokuapp.com/reservations の新規注文から行う

# こだわりポイント
こだわりポイントは注文内容の中にある省略ボタンです
これはスマートフォン、タブレット端末で操作する時に使用することを想定しておりパソコンだとあまり意味がないです。
このアプリを使うのはkouchのキッチン、デリバリーメンバー、大戸屋の方の三者で、
kouchキッチン、デリバリーは平均年齢が20歳ほどなので電話対応しながら打つのも可能だと思いました。
しかし大戸屋の方は平均年齢30-40歳で特に注文内容を聞きながら打ち込むのが困難だと感じたときに省略ボタンを考えた。
これを使うことでお客様からの注文をよりスムーズに打ち込むことができお客様のストレス軽減、電話対応短縮が可能となった。
実際にパートの方に使用してもらったところボタンを使う時と使わない時では30−40秒ほどの短縮ができた。

# 機能一覧
ユーザー登録、ログイン機能（devise)  
検索機能(ransnack)  

# 使用技術  
・Ruby 2.6.3     　　
・Rails 6.1.4.1      　　
・MySQL  8.0.26      　　 
・Puma      　　
・RSpec      　　
・rubocop      　　

# テスト
・RSpec    　　
  単体テスト(model)    　　
  機能テスト(request)    　　
  統合テスト(system)    　　

