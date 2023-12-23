# README

≪ながのCAKE≫の商品を通販するためのECサイト。

# 概要
　## 顧客側の機能

アカウント作成なしでながのCAKEの商品の閲覧が可能。
通販を利用する場合は、お客様にアカウント作成をして頂き、商品をカートに入れ注文が可能。
商品の配送先は自宅以外にも登録が可能。
注文から届くまでの状況を注文ステータスとして確認が可能。

## 管理者側の機能

商品、ジャンル、顧客情報の編集が可能。
お客様からの注文の管理、配送までの管理が可能。

# 機能
deviceを使用したログイン機能
gemを使用せず顧客側、管理者側の双方実装

# 要件
　こちらを参照してください。 （https://1drv.ms/b/s!As8deXD3koG_1jZrQKHGTeQ8fPRA?e=WggFb7）

# 使い方
　管理者ログインはメールアドレスを【0@0】、パスワードは【000000】で使用できます。 　顧客側の場合、新規作成で好きなアカウントを作成して利用が可能です。

# バージョン
　Rails 6.1.7.6 　ruby 3.1.2

# インストール
$ git clone git@github.com:manyhobbys/nagano_cake.git
$ cd nagano_cake
$ rails db:migrate
$ rails db:seed
$ bundle install
$ yarn install
$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object

# 作者
　片山翔平、照沼光輝、中西晴陽
