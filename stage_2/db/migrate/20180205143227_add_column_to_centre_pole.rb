class AddColumnToCentrePole < ActiveRecord::Migration[5.1]
  def change
  	add_column :poles, :etablissement_ght_id, :integer
  	add_column :centres_de_responsabilite, :etablissement_ght_id, :integer
  end
end
