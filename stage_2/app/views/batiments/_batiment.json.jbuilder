json.extract! batiment, :id, :nom, :localisation, :rue, :code_postal, :ville, :plan, :image, :etablissement_id, :created_at, :updated_at
json.url batiment_url(batiment, format: :json)
