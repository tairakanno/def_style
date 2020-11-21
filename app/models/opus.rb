class Opus < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes
  has_many :users, through: :likes
  with_options presence: true do
    validates :title, length: { in: 1..50 }
    validates :description, length: { in: 1..500 }
  end
  validates :video_or_image, presence: true

  def self.search(search)
    if search != ""
      Opus.where('title LIKE(?)', "%#{search}%")
    else
      Opus.all
    end
  end
  private
  def video_or_image
    youtube_url.present? || image.present?
  end
end
