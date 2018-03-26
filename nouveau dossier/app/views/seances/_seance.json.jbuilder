json.extract! seance, :id, :libelle, :duree, :formation_id, :created_at, :updated_at
json.url seance_url(seance, format: :json)
