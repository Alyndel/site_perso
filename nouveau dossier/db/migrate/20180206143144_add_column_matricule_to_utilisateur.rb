class AddColumnMatriculeToUtilisateur < ActiveRecord::Migration[5.1]
  def change
  	add_column :utilisateurs, :matricule_id, :integer
  end
end
