class Salle < ApplicationRecord
	belongs_to :batiment, required: false

	has_many :sessions_formation

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :plan, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :plan, content_type: /\Aimage\/.*\z/
end
