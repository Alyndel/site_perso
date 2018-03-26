class CreateGroupeDeSessions < ActiveRecord::Migration[5.1]
  def change

    create_table :groupes_de_sessions do |t|
      t.integer :formation_id
      t.string :libelle
    end

    add_column :sessions_formation, :groupe_de_sessions_id, :integer

  end
end
