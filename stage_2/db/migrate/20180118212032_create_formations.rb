class CreateFormations < ActiveRecord::Migration[5.1]
  def change
    create_table :formations do |t|
      t.string :libelle
      t.text :description
      t.string :code
      t.boolean :inscription_ouverte
      t.integer :nb_inscription_min
      t.integer :nb_inscription_max
      t.integer :duree
      t.text :programme_detaille
      t.text :objectifs_pedagogiques
      t.text :conditions_specifiques
      t.integer :theme_id
      t.integer :type_formation_id

      t.timestamps
    end
  end
end
