# アプリケーション名
 CafeSpace 

# アプリケーション概要
 カフェ店舗情報を自由に投稿でき、店舗場所や店舗内環境の情報が閲覧できる

# URL
 https://cafespace-36969.herokuapp.com/

# テスト用アカウント	

ログインに必要な情報
- メールアドレス名: taro@gmail.com
- パスワード: Taro11

Basic認証
 - ID:namoto
 - Pass:0615

# 利用方法	
- メールアドレスとパスワードを入力してログインする。ユーザー登録していない場合は、新規登録する。
- ログイン後、投稿されているカフェ店舗一覧が閲覧できる。店舗をクリックすると、詳細情報が見れる。
- 情報を投稿したい場合は、トップページ右上の投稿するボタンをクリックし、投稿作成画面で必要情報を入力する。

# 目指した課題解決	
- カフェで仕事や作業をしたい人に、利便性の高いカフェを紹介し、カフェ選びで失敗するリスクを軽減する。
- 具体的に、wifi環境や電源の有無、立地などの情報を事前に確認できることで、ネット回線やバッテリー切れの不安を解消できる。

# 洗い出した要件	
- 複数のユーザーが登録できて管理ができる、ユーザー管理機能
- ユーザーの情報投稿を可能にする、情報投稿機能
- ユーザーが投稿された情報を閲覧できる、投稿一覧表示機能
- ユーザーが投稿された情報をクリックすると、その詳細情報が閲覧できる、投稿詳細表示機能
- 情報を投稿したユーザーが、自分が投稿した情報を編集できる、投稿編集機能
- 情報を投稿したユーザーが、自分が投稿した情報を削除できる、投稿削除機能
- ユーザーが複数条件を指定した上で閲覧したい店舗の検索を可能にする、条件検索機能

# 実装した機能についての画像やGIFおよびその説明	

- 新規登録機能
[![Image from Gyazo](https://i.gyazo.com/c5b6b0c3b356b0b4e0962f743515c728.gif)](https://gyazo.com/c5b6b0c3b356b0b4e0962f743515c728)

- 店舗投稿機能
[![Image from Gyazo](https://i.gyazo.com/cd53571cc582d9618c98707fb25a5f08.gif)](https://gyazo.com/cd53571cc582d9618c98707fb25a5f08)

- 店舗詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/9c14f14c86d702c596e8c4f4d9ad4644.gif)](https://gyazo.com/9c14f14c86d702c596e8c4f4d9ad4644)

- 情報検索機能
[![Image from Gyazo](https://i.gyazo.com/c31501f965d95ef9ef66e6f3777f74fc.gif)](https://gyazo.com/c31501f965d95ef9ef66e6f3777f74fc)

# 実装予定の機能	
- 地図表示機能
- コメント投稿機能

# ローカルでの動作方法	

- % git clone https://github.com/namotoy/cafespace-36969.git
- % cd cafespace-36969
- % bundle install
- % yarn install
- % rails db:create
- % rails db:migrate
- % rails s  

 Rubyのバージョン: ruby 2.6.5

# データベース設計	
 ER図等を添付。
[![Image from Gyazo](https://i.gyazo.com/3e67088f5019055879cce5fb09185155.png)](https://gyazo.com/3e67088f5019055879cce5fb09185155)

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| city               | string              | null: false               |

### Association

* has_many :cafetypes
* has_many :comments

## cafetypes table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| shop_name          | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| block_number       | string     | null: false                    |
| wifi               | integer    | null: false                    |
| power_supply       | integer    | null: false                    |
| capacity           | integer    | null: false                    |
| toilet_place       | integer    | null: false                    |
| cafe_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| cafe        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :cafetype
- belongs_to :user


