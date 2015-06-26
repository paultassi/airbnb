class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  validates :start_date, presence: true
  validates :end_date, presence: true

  def price
    number_of_nights = (self.end_date - self.start_date).to_i
    booking_price = self.flat.price * number_of_nights
  end

end
