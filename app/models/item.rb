class Item < ApplicationRecord
  belongs_to :user
  has_many  :item_comments, dependent: :destroy
  has_many  :records
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :days_to_ship
  with_options presence: true, numericality: {other_than: 1} do
    validates :days_to_ship_id
  end
  with_options presence: true do
    validates :name, length: { in: 1..50 }
    validates :text, length: { in: 1..500 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end
end
