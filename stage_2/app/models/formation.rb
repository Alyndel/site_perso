class Formation < ApplicationRecord
	belongs_to :theme
	belongs_to :type_formation
	belongs_to :type_duree

	has_many :groupe_de_sessions
	has_many :seances
	# has_many :sessions_formation
	has_many :documents

	has_and_belongs_to_many :etablissements_ght, class_name: "EtablissementGht", foreign_key: "etablissement_ght_id"

	accepts_nested_attributes_for :seances, allow_destroy: true
	accepts_nested_attributes_for :groupe_de_sessions, allow_destroy: true
	# accepts_nested_attributes_for :sessions_formation, allow_destroy: true
	accepts_nested_attributes_for :documents, allow_destroy: true

end
