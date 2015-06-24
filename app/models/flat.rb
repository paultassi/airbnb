class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :house_type, presence: true, inclusion: {in: ["Full house", "Shared room", "Private room"], allow_nil: false}

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
