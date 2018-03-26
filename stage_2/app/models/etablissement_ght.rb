class EtablissementGht < ApplicationRecord
	has_many :poles
	has_many :etablissemnts
	has_many :centres_de_responsabilite
	has_many :unites_fonctionnelles
	has_many :batiments
	has_and_belongs_to_many :utilisateurs
	has_and_belongs_to_many :formations
end
