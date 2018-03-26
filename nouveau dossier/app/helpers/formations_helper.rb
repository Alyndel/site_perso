module FormationsHelper

	# def afficher_duree(valeur)
	# 	if valeur
	# 		if valeur.to_f < 1440
	# 			return (valeur.to_f / 60.0).to_s # +"h"
	# 		elsif valeur.to_f >= 1440
	# 			return (valeur.to_f / 24 /60.0).to_s # + "j"
	# 		end
	# 	end
	# end

	def concatener_des_dates(collection = nil)
		t = []
		if collection
			collection.each do |col|
				t << "#{col.date_debut.strftime('%d/%m/%Y')} de #{col.heure_debut.strftime('%H:%M')} à #{col.heure_fin.strftime('%H:%M')}"
			end
		end
		t.join(" et ") || t
	end

end
