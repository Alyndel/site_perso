class Matricule < ApplicationRecord
	belongs_to :utilisateur

	# Les 3 méthodes suivantes permettent d'attaquer la base et qu'elle nous retourne les informations dont on a besoin.
	# La première s'occupe donc du libellé, la deuxième du nom de la personne ayant le matricule,
	# et la troisième le prénom.

	def self.requete_matricule(requete)
		@matricules = Matricule.where(libelle: requete)
		return @matricules
	end

	# ======================================================================================================================

	def self.requete_nom(requete)
		if (requete.is_a? String)
			@matricules = Matricule.where(utilisateur_id: (Utilisateur.where(nom_phonetique: requete.phonetique)).ids)
		else
			@matricules = Matricule.where(utilisateur_id: (Utilisateur.where(nom_phonetique: "")).ids)
		end
		return @matricules
	end

	# ======================================================================================================================
	
	def self.requete_prenom(requete)
		if (requete.is_a? String)
			@matricules = Matricule.where(utilisateur_id: (Utilisateur.where(prenom_phonetique: requete.phonetique)).ids)
		else
			@matricules = Matricule.where(utilisateur_id: (Utilisateur.where(prenom_phonetique: "")).ids)
		end
		return @matricules
	end

end
