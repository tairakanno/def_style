class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :genre
  has_many  :comments
  has_many  :item_comments, dependent: :destroy
  has_one_attached :image
  validates :nickname, presence: true
  validates :prefecture, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :genre_id,  numericality: { other_than: 1 }
  has_many :opuses, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
