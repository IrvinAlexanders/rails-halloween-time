class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_many_attached :photos

  CATEGORIES = ['Heroes', 'Horror', 'Movies', 'Animals', 'Anime', 'TV Show', 'Historical Figures', 'Princess', 'Cartoon']
  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :photo, presence: true
  # validates :availability, presence: true
  def average_rating
    return 'n/a' if reviews.empty?
    #return 0 if reviews.empty?
    (reviews.pluck(:rating).sum / reviews.count.to_f).round(2)
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
