class Groupe < ApplicationRecord

	has_and_belongs_to_many :utilisateurs

	def self.search_by(collection, tags = ["Code", "Libelle"])
		h = {}
		tags.each do |tag|
			h[tag.snakecase] = collection.search(tag).first.text
		end
		h
	end

	# ======================================================================================================================

	# Méthode permettant de charger tous les profils du CHU, à partir d'un fichier XML,
	# dont on lui fournit le chemin comme argument.

	def self.chargement_complet_profils(url = nil)
		if url
			@dom_document = Nokogiri::XML(File.open(url))
			# Structure en cascade : Profils > Profil > Code, Libelle

			# Etablissements du G.H.T.
			@dom_document.xpath("//Profil").each do |le_profil|				
				valeurs = self.search_by le_profil
				profil = Groupe.where(code: valeurs["code"]).first_or_create!(libelle: valeurs["libelle"], type_groupe: "Profil")				
			end
		else
			raise "Vous devez passer le nom du fichier avec le chemin"
		end
	end

end