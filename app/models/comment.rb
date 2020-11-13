class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :opus
  validates :text, presence: true
end
