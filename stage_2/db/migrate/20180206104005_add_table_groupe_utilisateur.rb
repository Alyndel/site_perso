class AddTableGroupeUtilisateur < ActiveRecord::Migration[5.1]
  def change
  	create_table :groupes_utilisateurs do |t|
  		t.integer :profil_id
  		t.integer :utilisateur_id

  		t.timestamp
  	end
  end
end
