class Opus < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  with_options presence: true do
    validates :title
    validates :description
  end
  def self.search(search)
    if search != ""
      Opus.where('title LIKE(?)', "%#{search}%")
    else
      Opus.all
    end
  end

end
