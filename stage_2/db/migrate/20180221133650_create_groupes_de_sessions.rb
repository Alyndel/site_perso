class CreateGroupesDeSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :groupes_de_sessions do |t|
      t.string :libelle
      t.integer :formation_id

      t.timestamps
    end
  end
end
