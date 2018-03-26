class Utilisateur < ApplicationRecord
	has_and_belongs_to_many :groupes
	has_and_belongs_to_many :sessions
	has_many :matricules

	# Permet de vider complètement les tables Utilisateur et Matricule.
	def self.vider_les_agents
		Utilisateur.delete_all
		Matricule.delete_all
	end

	# ======================================================================================================================

	# Permet d'effectuer une recherche sur les tags, évitant ainsi la répétition de code.
	def self.search_by(collection, tags = ["NomUsage", "PrenomUsage", "IdRES", "DateNaissance", "CommuneNaissance", "DateDebut", "DateFin"])
		h = {}
		tags.each do |tag|
			h[tag] = collection.search(tag).first.text
		end
		h
	end

	# ======================================================================================================================

	# Méthode permettant le chargement de tous les utilisateurs du CHU, à partir d'un fichier XML,
	# dont on fournit le chemin en argument.

	def self.chargement_complet_agents(url = nil)
		if url
			@dom_document = Nokogiri::XML(File.open(url), nil, 'UTF-8')
			# Structure en cascade : Personne > Noms, Prénoms, DateNaissance, Identifiants (> IdRES), Profils (> Profil > Code, Libelle, DateDebut, DateFin) , Affectations (> EntiteJuridique > Matricule)

			# Agents du G.H.T.
			@dom_document.xpath("//Personne").each do |une_personne|
				valeurs = self.search_by une_personne

				utilisateur = Utilisateur.where(idres: valeurs["IdRES"]).first_or_create!(nom_usage: valeurs["NomUsage"], prenom_usage: valeurs["PrenomUsage"], nom_phonetique: valeurs["NomUsage"].phonetique, prenom_phonetique: valeurs["PrenomUsage"].phonetique, date_naissance: valeurs["DateNaissance"], date_entree: valeurs["DateDebut"], date_sortie: valeurs["DateFin"])
				#Profils
				t = []
				une_personne.search("Profil").each do |un_profil|
					le_profil = Groupe.where(code: un_profil.search("Code").first.text).first
					t << le_profil.id

					if (["R027", "R026"].include? un_profil.search("Code").first.text)
						le_cadre = Groupe.where(code: valeurs["IdRES"]).first_or_create(libelle: valeurs["NomUsage"] + " " + valeurs["PrenomUsage"], type_groupe: "Cadre")
					else
						une_personne.search("Metier").each do |un_metier|
							un_metier.search("Libelle").each do |le_metier|
								if (le_metier)
									if (le_metier.text == "Encadrant d'unité de soin")
										le_cadre = Groupe.where(code: valeurs["IdRES"]).first_or_create(libelle: valeurs["NomUsage"] + " " + valeurs["PrenomUsage"], type_groupe: "Cadre")
									end
								end
							end
						end
					end
				end

				utilisateur.groupe_ids = t

				#Matricule
				une_personne.search("EntiteJuridique").each do |une_entite|
					matricule = Matricule.where(libelle: une_entite.search("Matricule").first.text).first_or_create(utilisateur_id: utilisateur.id)
				end
			end
		else
			raise "Vous devez passer le nom du fichier avec le chemin, et son extension."
		end
	end

	# ======================================================================================================================

	# Les 3 méthodes suivantes permettent d'attaquer les bases en fonction de ce qu'il lui est fourni.
	# On fait la différence entre un IdRES fourni, un nom ou un prénom.

	def self.requete_id(requete)
		@utilisateurs = Utilisateur.where(idres: requete)
		return @utilisateurs
	end

	# ======================================================================================================================

	def self.requete_nom(requete)
		if (requete.is_a? String)
			@utilisateurs = Utilisateur.where(nom_phonetique: requete.phonetique)
		else
			@utilisateurs = Utilisateur.where(nom_phonetique: "")
		end
		return @utilisateurs
	end

	# ======================================================================================================================

	def self.requete_prenom(requete)
		if (requete.is_a? String)
			@utilisateurs = Utilisateur.where(prenom_phonetique: requete.phonetique)
		else
			@utilisateurs = Utilisateur.where(prenom_phonetique: "")
		end
		return @utilisateurs
	end
end
