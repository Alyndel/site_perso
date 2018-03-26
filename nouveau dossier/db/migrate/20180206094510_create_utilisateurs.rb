class CreateUtilisateurs < ActiveRecord::Migration[5.1]
  def change
    create_table :utilisateurs do |t|
      t.string :idres
      t.string :nom_usage
      t.string :prenom_usage
      t.date :date_naissance
      t.string :matricule
      t.date :date_entree
      t.date :date_sortie

      t.timestamps
    end
  end
end
