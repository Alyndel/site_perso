json.extract! session, :id, :description, :date_debut, :heure_debut, :date_fin_date, :heure_fin, :statut, :presence, :created_at, :updated_at
json.url session_url(session, format: :json)
