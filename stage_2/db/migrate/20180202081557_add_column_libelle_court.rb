class AddColumnLibelleCourt < ActiveRecord::Migration[5.1]
  def change
  	add_column :etablissements, :libelle_court, :string
  	add_column :unites_fonctionnelles, :libelle_court, :string
  	add_column :centres_de_responsabilite, :libelle_court, :string
  	add_column :poles, :libelle_court, :string
  	
  	add_column :etablissements, :adresse, :string
  end
end
