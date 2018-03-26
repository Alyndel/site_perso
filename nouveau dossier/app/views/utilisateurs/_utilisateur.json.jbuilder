json.extract! utilisateur, :id, :idres, :nom_usage, :prenom_usage, :date_naissance, :matricule, :date_entree, :date_sortie, :created_at, :updated_at
json.url utilisateur_url(utilisateur, format: :json)
