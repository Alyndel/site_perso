class AddForeignKeysToUniteFonctionnelle < ActiveRecord::Migration[5.1]
  def change
  	add_column :unites_fonctionnelles, :etablissement_id, :integer
  	add_column :unites_fonctionnelles, :centre_de_responsabilite_id, :integer
  	add_column :unites_fonctionnelles, :pole_id, :integer
  	add_column :unites_fonctionnelles, :etablissement_ght_id, :integer

  	add_column :etablissements, :etablissement_ght_id, :integer
  end
end
