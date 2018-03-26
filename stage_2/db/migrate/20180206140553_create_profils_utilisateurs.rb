class CreateProfilsUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    drop_table :groupes_utilisateurs
    create_table :profils_utilisateurs, id: false do |t|
    	t.integer :profil_id
  		t.integer :utilisateur_id

  		t.timestamp
    end
  end
end
