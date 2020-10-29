class Opus < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :description
  end
  

end
