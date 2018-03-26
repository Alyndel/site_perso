class CentreDeResponsabilite < ApplicationRecord
	has_many :unites_fonctionnelles
	belongs_to :etablissement_ght
end
