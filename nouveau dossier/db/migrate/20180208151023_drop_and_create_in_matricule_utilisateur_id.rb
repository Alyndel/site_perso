class DropAndCreateInMatriculeUtilisateurId < ActiveRecord::Migration[5.1]
  def change
  	remove_column :utilisateurs, :matricule
  	remove_column :utilisateurs, :matricule_id
  	add_column :matricules, :utilisateur_id, :integer
  end
end
