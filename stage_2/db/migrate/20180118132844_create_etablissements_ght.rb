class CreateEtablissementsGht < ActiveRecord::Migration[5.1]
  def change
    create_table :etablissements_ght do |t|
      t.string :libelle
      t.string :code

      t.timestamps
    end
  end
end
