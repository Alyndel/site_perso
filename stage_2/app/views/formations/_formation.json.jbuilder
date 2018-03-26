json.extract! formation, :id, :libelle, :description, :code, :inscription_ouverte, :nb_inscription_min, :nb_inscription_max, :duree, :programme_detaille, :objectifs_pedagogiques, :conditions_specifiques, :theme_id, :type_formation_id, :created_at, :updated_at
json.url formation_url(formation, format: :json)
