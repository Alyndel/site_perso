class AddTableUtilisateurUf < ActiveRecord::Migration[5.1]
  def change
  	create_table :unites_fonctionnelles_utilisateurs do |t|
  		t.integer :utilisateur_id
  		t.integer :unite_fonctionnelle_id

  		t.timestamp
  	end
  end
end
