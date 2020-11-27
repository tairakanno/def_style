# README

## 🌐 App URL

### **https://defstyle.herokuapp.com/**  

https://i.gyazo.com/34171d74e096b91734664eaf98105c64.gif

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
