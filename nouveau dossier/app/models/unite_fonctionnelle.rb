class UniteFonctionnelle < ApplicationRecord
	belongs_to :etablissement
	belongs_to :etablissement_ght
	belongs_to :centre_de_responsabilite
	belongs_to :pole

	# Méthode permettant de vider les tables EtablissementGht, Etablissement, Pole, CentreDeResponsabilite et
	# UniteFonctionnelle.
	def self.vider_les_structures
		EtablissementGht.delete_all
		Etablissement.delete_all
		Pole.delete_all
		CentreDeResponsabilite.delete_all
		UniteFonctionnelle.delete_all
	end

	def self.search_by(collection, tags = ["code", "libelleLong", "libelleCourt"])
		h = {}
		tags.each do |tag|
			h[tag.snakecase] = collection.search(tag).first.text
		end
		h
	end

	# ======================================================================================================================

	# Méthode permettant de charger les structures de l'hôpital, grâce à un fichier xml
	# dont on fournit le chemin en argument.
	
	def self.chargement_complet_structure(url = nil)
		if url
			@dom_document = Nokogiri::XML(File.open(url))
			# Structure en cascade : EtablissementGht > Etablissement > Pôle > CentreDeResponsabilite > UniteFonctionnelle

			# Etablissements du G.H.T.
			@dom_document.xpath("//site").each do |site|
				valeurs = self.search_by site
				 etablissement_ght = EtablissementGht.where(code: valeurs["code"]).first_or_create!(libelle: valeurs["libelle_court"])

				# Etablissements
				site.search("etablissement").each do |etab|
					valeurs = self.search_by etab
					etablissement = Etablissement.where(code: valeurs["code"]).first_or_create!(libelle_court: valeurs["libelle_court"], libelle: valeurs["libelle_long"], etablissement_ght_id: etablissement_ght.id)

					# Pôles
					etab.search("pole").each do |pol|
						valeurs = self.search_by pol
						pole = Pole.where(code: valeurs["code"]).first_or_create!(libelle_court: valeurs["libelle_court"], libelle: valeurs["libelle_long"], etablissement_ght_id: etablissement_ght.id)

						# Centres de responsabilité
						pol.search("centreResponsabilite").each do |cr|
							valeurs = self.search_by cr
							centre_responsabilite = CentreDeResponsabilite.where(code: valeurs["code"]).first_or_create!(libelle_court: valeurs["libelle_court"], libelle: valeurs["libelle_long"], etablissement_ght_id: etablissement_ght.id)

							# Unités Fonctionnelles
							cr.search("uniteFonctionnelle").each do |uf|
								valeurs = self.search_by uf
								unite = UniteFonctionnelle.where(code: valeurs["code"]).first_or_create!(libelle_court: valeurs["libelle_court"], libelle: valeurs["libelle_long"], etablissement_ght_id: etablissement_ght.id, pole_id: pole.id, centre_de_responsabilite_id: centre_responsabilite.id, etablissement_id: etablissement.id )
							end
						end
					end
				end
			end
		else
			raise "Vous devez passer le nom du fichier avec le chemin"
		end
	end


	#  def self.peuplement
	#  	contenu = File.read('./structures_hospitalieres_05022018.xml')
	# 	h = Hash.from_xml(contenu)

	# 	les_sites = h["structureHospitaliere"]["site"]

	# 	le_etablissement_ght = EtablissementGht.new
	# 	le_etablissement_ght.libelle = les_sites["libelleLong"]
	# 	le_etablissement_ght.code = les_sites["code"]
	# 	le_etablissement_ght.save

	# 	les_sites["groupement"]["etablissement"].each do |le_etab|
	# 		un_etablissement = Etablissement.new
	# 		un_etablissement.code = le_etab["code"]
	# 		un_etablissement.libelle_court = le_etab["libelleCourt"]
	# 		un_etablissement.adresse = le_etab["adresse"]["ligne"] + " " + le_etab["adresse"]["codePostal"] + " " + le_etab["adresse"]["ville"]
	# 		un_etablissement.libelle = le_etab["libelleLong"]
	# 		un_etablissement.etablissement_ght_id = le_etablissement_ght.id
	# 		un_etablissement.save

	# 		if (le_etab["pole"])
	# 			if (le_etab["pole"].is_a? Array)
	# 				le_etab["pole"].each do |le_pole|
	# 					un_pole = Pole.new
	# 					un_pole.code = le_pole["code"]
	# 					un_pole.libelle = le_pole["libelleLong"]
	# 					un_pole.libelle_court = le_pole["libelleCourt"]
	# 					un_pole.etablissement_ght_id = le_etablissement_ght.id
	# 					un_pole.save

	# 					#puts "Pole : " + le_pole["libelleLong"]
	# 					if (le_pole["centreResponsabilite"])
	# 						if (le_pole["centreResponsabilite"].is_a? Array)
	# 							le_pole["centreResponsabilite"].each do |le_centre|
	# 								un_centre = CentreDeResponsabilite.new
	# 								un_centre.code = le_centre["code"]
	# 								un_centre.libelle = le_centre["libelleLong"]
	# 								un_centre.libelle_court = le_centre["libelleCourt"]
	# 								un_centre.etablissement_ght_id = le_etablissement_ght.id
	# 								un_centre.save

	# 								#puts "Centre : " + le_centre["libelleLong"]
	# 								if (le_centre["uniteFonctionnelle"])
	# 									if (le_centre["uniteFonctionnelle"].is_a? Array)
	# 										le_centre["uniteFonctionnelle"].each do |la_unite|
	# 											une_unite = UniteFonctionnelle.new
	# 											une_unite.code = la_unite["code"]
	# 											une_unite.libelle = la_unite["libelleLong"]
	# 											une_unite.libelle_court = la_unite["libelleCourt"]
	# 											une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 											une_unite.etablissement_id = un_etablissement.id
	# 											une_unite.centre_de_responsabilite_id = un_centre.id
	# 											une_unite.pole_id = un_pole.id
	# 											une_unite.save!

	# 											#puts "L'unite : " + la_unite["libelleLong"]
	# 										end
	# 									else
	# 										une_unite = UniteFonctionnelle.new
	# 										une_unite.code = le_centre["uniteFonctionnelle"]["code"]
	# 										une_unite.libelle = le_centre["uniteFonctionnelle"]["libelleLong"]
	# 										une_unite.libelle_court = le_centre["uniteFonctionnelle"]["libelleCourt"]
	# 										une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 										une_unite.etablissement_id = un_etablissement.id
	# 										une_unite.centre_de_responsabilite_id = un_centre.id
	# 										une_unite.pole_id = un_pole.id
	# 										une_unite.save!

	# 										#puts "L'unite : " + le_centre["uniteFonctionnelle"]["libelleLong"]
	# 									end
	# 								else
	# 									#puts "Le centre de responsabilité n'a pas d'unité fonctionnelle"
	# 								end
	# 							end
	# 						else
	# 							un_centre = CentreDeResponsabilite.new
	# 							un_centre.code = le_pole["centreResponsabilite"]["code"]
	# 							un_centre.libelle = le_pole["centreResponsabilite"]["libelleLong"]
	# 							un_centre.libelle_court = le_pole["centreResponsabilite"]["libelleCourt"]
	# 							un_centre.etablissement_ght_id = le_etablissement_ght.id
	# 							un_centre.save

	# 							#puts "Centre : " + le_pole["centreResponsabilite"]["libelleLong"]
	# 							if (le_pole["centreResponsabilite"]["uniteFonctionnelle"])
	# 								if (le_pole["centreResponsabilite"]["uniteFonctionnelle"].is_a? Array)
	# 									le_pole["centreResponsabilite"]["uniteFonctionnelle"].each do |la_unite|
	# 										une_unite = UniteFonctionnelle.new
	# 										une_unite.code = la_unite["code"]
	# 										une_unite.libelle = la_unite["libelleLong"]
	# 										une_unite.libelle_court = la_unite["libelleCourt"]
	# 										une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 										une_unite.etablissement_id = un_etablissement.id
	# 										une_unite.centre_de_responsabilite_id = un_centre.id
	# 										une_unite.pole_id = un_pole.id
	# 										une_unite.save!

	# 										#puts "L'unite : " + la_unite["libelleLong"]
	# 									end
	# 								else
	# 									une_unite = UniteFonctionnelle.new
	# 									une_unite.code = le_pole["centreResponsabilite"]["uniteFonctionnelle"]["code"]
	# 									une_unite.libelle = le_pole["centreResponsabilite"]["uniteFonctionnelle"]["libelleLong"]
	# 									une_unite.libelle_court = le_pole["centreResponsabilite"]["uniteFonctionnelle"]["libelleCourt"]
	# 									une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 									une_unite.etablissement_id = un_etablissement.id
	# 									une_unite.centre_de_responsabilite_id = un_centre.id
	# 									une_unite.pole_id = un_pole.id
	# 									une_unite.save!

	# 									#puts "L'unite : " + le_pole["centreResponsabilite"]["uniteFonctionnelle"]["libelleLong"]
	# 								end
	# 							else
	# 								#puts "Le centre de responsabilité n'a pas d'unité fonctionnelle"
	# 							end
	# 						end
	# 					else
	# 						#puts "Le pôle ne possède pas de centre de responsabilité"
	# 					end
	# 				end
	# 			else
	# 				un_pole = Pole.new
	# 				un_pole.code = le_etab["pole"]["code"]
	# 				un_pole.libelle = le_etab["pole"]["libelleLong"]
	# 				un_pole.libelle_court = le_etab["pole"]["libelleCourt"]
	# 				un_pole.etablissement_ght_id = le_etablissement_ght.id
	# 				un_pole.save

	# 				#puts "Pole : " + le_etab["pole"]["libelleLong"]
	# 				if (le_etab["pole"]["centreResponsabilite"])
	# 					if (le_etab["pole"]["centreResponsabilite"].is_a? Array)
	# 						le_etab["pole"]["centreResponsabilite"].each do |le_centre|
	# 							un_centre = CentreDeResponsabilite.new
	# 							un_centre.code = le_centre["code"]
	# 							un_centre.libelle = le_centre["libelleLong"]
	# 							un_centre.libelle_court = le_centre["libelleCourt"]
	# 							un_centre.etablissement_ght_id = le_etablissement_ght.id
	# 							un_centre.save

	# 							#puts "Centre : " + le_centre["libelleLong"]
	# 							if (le_centre["uniteFonctionnelle"])
	# 								if (le_centre["uniteFonctionnelle"].is_a? Array)
	# 									le_centre["uniteFonctionnelle"].each do |la_unite|
	# 										une_unite = UniteFonctionnelle.new
	# 										une_unite.code = la_unite["code"]
	# 										une_unite.libelle = la_unite["libelleLong"]
	# 										une_unite.libelle_court = la_unite["libelleCourt"]
	# 										une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 										une_unite.etablissement_id = un_etablissement.id
	# 										une_unite.centre_de_responsabilite_id = un_centre.id
	# 										une_unite.pole_id = un_pole.id
	# 										une_unite.save!

	# 										#puts "L'unite : " + la_unite["libelleLong"]
	# 									end
	# 								else
	# 									une_unite = UniteFonctionnelle.new
	# 									une_unite.code = le_centre["uniteFonctionnelle"]["code"]
	# 									une_unite.libelle = le_centre["uniteFonctionnelle"]["libelleLong"]
	# 									une_unite.libelle_court = le_centre["uniteFonctionnelle"]["libelleCourt"]
	# 									une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 									une_unite.etablissement_id = un_etablissement.id
	# 									une_unite.centre_de_responsabilite_id = un_centre.id
	# 									une_unite.pole_id = un_pole.id
	# 									une_unite.save!

	# 									#puts "L'unite : " + le_centre["uniteFonctionnelle"]["libelleLong"]
	# 								end
	# 							else
	# 								#puts "Le centre de responsabilité n'a pas d'unité fonctionnelle"
	# 							end
	# 						end
	# 					else
	# 						un_centre = CentreDeResponsabilite.new
	# 						un_centre.code = le_etab["pole"]["centreResponsabilite"]["code"]
	# 						un_centre.libelle = le_etab["pole"]["centreResponsabilite"]["libelleLong"]
	# 						un_centre.libelle_court = le_etab["pole"]["centreResponsabilite"]["libelleCourt"]
	# 						un_centre.etablissement_ght_id = le_etablissement_ght.id
	# 						un_centre.save

	# 						#puts "Centre : " + le_etab["pole"]["centreResponsabilite"]["libelleLong"]
	# 						if (le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"])
	# 							if (le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"].is_a? Array)
	# 								le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"].each do |la_unite|
	# 									une_unite = UniteFonctionnelle.new
	# 									une_unite.code = la_unite["code"]
	# 									une_unite.libelle = la_unite["libelleLong"]
	# 									une_unite.libelle_court = la_unite["libelleCourt"]
	# 									une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 									une_unite.etablissement_id = un_etablissement.id
	# 									une_unite.centre_de_responsabilite_id = un_centre.id
	# 									une_unite.pole_id = un_pole.id
	# 									une_unite.save!

	# 									#puts "L'unite : " + la_unite["libelleLong"]
	# 								end
	# 							else
	# 								une_unite = UniteFonctionnelle.new
	# 									une_unite.code = le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"]["code"]
	# 									une_unite.libelle = le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"]["libelleLong"]
	# 									une_unite.libelle_court = le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"]["libelleCourt"]
	# 									une_unite.etablissement_ght_id = le_etablissement_ght.id
	# 									une_unite.etablissement_id = un_etablissement.id
	# 									une_unite.centre_de_responsabilite_id = un_centre.id
	# 									une_unite.pole_id = un_pole.id
	# 									une_unite.save!

	# 								#puts "L'unite : " + le_etab["pole"]["centreResponsabilite"]["uniteFonctionnelle"]["libelleLong"]
	# 							end
	# 						else
	# 							#puts "Le centre de responsabilité n'a pas d'unité fonctionnelle"
	# 						end
	# 					end
	# 				else
	# 					#puts "Le pôle ne possède pas de centre de responsabilité"
	# 				end
	# 			end
	# 		else
	# 			#puts "L'établissement ne possède pas de pôle"
	# 		end
	# 	end
	# end

end
