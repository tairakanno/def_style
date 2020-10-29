class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  validates :nickname, presence: true
  validates :prefecture, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }
  has_many :opuses
end
