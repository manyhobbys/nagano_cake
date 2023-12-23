# README

　ながのCAKE の商品を通販で購入できるECサイトです。

## 概要
### 実装機能
　deviseを使用したログイン機能の実装。
　gemを使用せずに顧客側、管理者側両方の機能を実装。
　Enumの導入による翻訳機能の実装。

### 顧客側の機能
　アカウントがなくても商品閲覧は可能。
　通販を利用する場合はお客様にアカウントを作成をして頂き、商品をカートに入れることで注文が可能。
　商品の配送先は複数の登録が可能。
　注文から届くまでの状況は注文ステータスで確認可能。

### 管理者側の機能
　商品、ジャンル、顧客情報の編集が可能。
　お客様からの注文の管理、配送までの管理が可能。



## 要件
　こちらをご参照ください。 （https://1drv.ms/b/s!As8deXD3koG_1jZrQKHGTeQ8fPRA?e=WggFb7）


## 使用方法
　管理者ログインはメールアドレスを【0@0】、パスワードは【000000】を入力することで各機能を使用できます。
　
　顧客側はお好きなアカウントを新規作成することで機能の利用が可能です。


## バージョン
　Ruby 3.1.2
 
　Rails 6.1.7.6


## インストール
　$ git clone git@github.com:manyhobbys/nagano_cake.git

　$ cd nagano_cake

　$ rails db:migrate

　$ rails db:seed

　$ bundle install

　$ yarn install

　$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object


## 制作者
　片山翔平、照沼光輝、中西晴陽
