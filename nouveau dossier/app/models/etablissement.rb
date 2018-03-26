class Etablissement < ApplicationRecord
	has_many :unites_fonctionnelles
	belongs_to :etablissement_ght
	has_many :batiments
end
