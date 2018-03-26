json.extract! actualite, :id, :titre, :contenu, :created_at, :updated_at
json.url actualite_url(actualite, format: :json)
