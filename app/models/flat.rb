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
  validates :description, presence: true
  validates :room_number, presence: true
  validates :bed_number, presence: true

  has_attached_file :picture,
    styles: { banner: "1280x500#", medium: "300x200#", thumb: "100x100#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  def full_address
  "#{street}, #{city}, #{zip_code}"
  end


geocoded_by :full_address
after_validation :geocode, if: ->(flat){
flat.street.present? and flat.street_changed? ||
flat.city.present? and  flat.city_changed? ||
flat.zip_code.present? and flat.zip_code_changed?
}

end
