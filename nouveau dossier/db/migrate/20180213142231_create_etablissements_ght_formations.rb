class CreateEtablissementsGhtFormations < ActiveRecord::Migration[5.1]
  def change
    create_table :etablissements_ght_formations, id: false do |t|
    	t.integer	:etablissement_ght_id
    	t.integer :formation_id
    end
  end
end
