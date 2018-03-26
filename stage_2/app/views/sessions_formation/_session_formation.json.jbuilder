json.extract! session_formation, :id, :description, :date_debut, :heure_debut, :date_fin, :heure_fin, :statut, :presence, :created_at, :updated_at
json.url session_formation_url(session_formation, format: :json)
