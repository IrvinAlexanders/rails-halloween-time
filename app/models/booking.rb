class Booking < ApplicationRecord
  belongs_to :costume
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, rejected: 2 }
  validates :user, presence: true
  validates :costume, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true

  def total_days
    (self.end_date - self.start_date).to_i
  end

  def total_price
    return 0 if Booking.all.empty?
    (self.costume.price * total_days)
  end
end
