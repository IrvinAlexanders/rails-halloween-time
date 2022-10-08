class Review < ApplicationRecord
  belongs_to :costume

  validates :costume, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
