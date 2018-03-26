class CreateColumnInSessionFormation < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions_formation, :formation_id, :integer
    add_column :sessions_formation, :salle_id, :integer

    create_table :sessions_formation_utilisateurs, id: false do |t|
    	t.integer :session_formation_id
  		t.integer :utilisateur_id

  		t.timestamp
    end

  end
end
