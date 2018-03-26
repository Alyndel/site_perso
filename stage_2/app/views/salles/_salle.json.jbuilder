json.extract! salle, :id, :nom, :description, :capacite, :niveau, :plan, :image, :batiment_id, :created_at, :updated_at
json.url salle_url(salle, format: :json)
