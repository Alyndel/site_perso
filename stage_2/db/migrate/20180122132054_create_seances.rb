class CreateSeances < ActiveRecord::Migration[5.1]
  def change
    create_table :seances do |t|
      t.string :libelle
      t.float :duree
      t.integer :formation_id

      t.timestamps
    end
  end
end
