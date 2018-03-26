class CreateGroupesUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :groupes_utilisateurs, id: false do |t|
    	t.integer :groupe_id
    	t.integer :utilisateur_id

    	t.timestamp
    end
  end
end
