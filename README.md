# README

## :scroll: Def Style
HipHopカルチャーを舞台に、まだ無名のアーティストや、アンダーグラウンドを活動拠点としているアーティストが作品を公開し共同製作者を探すことができるアプリケーションです。

## :scroll:　Story
自分はHipHopカルチャーの中でもrap、DJに興味がありました。rapを構成するtrapを初めて作り、誰かに自分の作ったtrapの上でrapをして欲しいと思い立った時、HipHop専門の共同催作者を募るプラットフォームやコミュニティがwebアプリケーションでは少ないことがわかりました。HipHopアーティストの繋がりは、クラブやサイファーといったオフラインがメインとなります。しかし、コロナウイルス感染予防のため人との接触が避けられている状況下では音楽の共同制作の可能性は限られてしまいます。私は無名でも、本気じゃなくても、気軽にアーティスト同士が繋がれてもいいのではないかと思います。
以上のことから、Def Styleを作成することを決めました。
Def Styleの『Def』とはHipHop用語で『イケてる』という意味があります。自分と価値観や目的が近い人と是非繋がるツールとしてご利用ください。


## :art: Character Design

<p align="center">
  <img src="https://i.gyazo.com/048d778f7972cc6c2bd63915b6731fba.jpg" width=70%>  
</p>　


## :movie_camera: Gif

<a href="https://gyazo.com/73331196bdb6f1301cafaa2e8177251e"><img src="https://i.gyazo.com/73331196bdb6f1301cafaa2e8177251e.gif" alt="Image from Gyazo" width="1000"/></a>



## 🌐 App URL

### **https://defstyle.herokuapp.com/**


## :scroll:　Description
作品はグラフティーアーティストなら画像を、それ以外のアーティストは自分で制作したyoutube_urlを投稿し、公開されている作品をを基に、実際に製作者とコンタクトをとることができます。
また作った作品をアプリケーション内で販売することも可能です。


## 📦 Features
自分がこのアプリケーションの注目機能はいいね機能です。
非同期通信でいいね機能を実装し、自分のいいねした作品を一覧でみれる点です。

<a href="https://gyazo.com/a06d1d0b24838bd286352aa751d91c0b"><img src="https://i.gyazo.com/a06d1d0b24838bd286352aa751d91c0b.gif" alt="Image from Gyazo" width="1000"/></a>

さらに気に入った作品にコメントするのとは別に、作者とUSERとの一対一のDM機能も実装しました。

<a href="https://gyazo.com/c197fa5b065b3ff7585f6062eac1b573"><img src="https://i.gyazo.com/c197fa5b065b3ff7585f6062eac1b573.gif" alt="Image from Gyazo" width="1000"/></a>


## Author
* Taira Kanno
* tairakannotaira@gmail.com

## 利用したプログラミング言語
Ruby,javascript

## 利用したフレームワーク・ライブラリ
Ruby on Rails,
Bootstrap,
jquery

## Uその他開発に使用したツール
GitHub,
Vim

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false | unique: true
| password       | string | null: false |
| profile        | text   
| prefecture_id  | integer   | null: false |
| genre_id       | integer   | null: false |
### Association

- has_many :opuses
- has_many :items
- has_many :comments
- has_many :likes
- has_many :messages
- has_many :entries
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :genre
- has_one_attached :image
## items テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| name           | text   | null: false |
| text           | text   | null: false |
| days_to_ship_id| integer | null: false |
| price          | integer | null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :records
- has_many :item_comments
- belongs_to_active_hash :category
- belongs_to_active_hash :days_to_ship
- has_one_attached :image

## opuses テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| title          | text   | null: false |
| description    | text   | null: false |
| youtube_url    | text   |
| price          | integer | null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :likes
- has_one_attached :image


## comments テーブル

| Column        | Type       | Options           |
| ------        | ---------- | ----------------- |
| text          | text       |  
| user          | references | foreign_key: true |
| opus          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :opus

## item_comments テーブル

| Column        | Type       | Options           |
| ------        | ---------- | ----------------- |
| text          | text       |  
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## likes テーブル

| Column        | Type       | Options           |
| ------        | ---------- | ----------------- |
| user          | references | foreign_key: true, null: false |
| opus          | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :opus

## records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## shipping_address テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| postal_code       | string | null: false |
| prefecture_id     | integer| null: false |
| municipality      | string | null: false |
| address           | string | null: false |
| building_name     | string | 
| phone_number      | string | null: false |
| purchase_record   | references | null: false, foreign_key: true |

### Association
- belongs_to :record
- belongs_to_active_hash :prefecture

## rooms テーブル

| Column        | Type       | Options              |
| ------        | ---------- | -------------------- |
| name          | string     | 

### Association

- has_many :messages
- has_many :entries

## entries テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## messages テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |
| content       | text       |

### Association

- belongs_to :user
- belongs_to :room
