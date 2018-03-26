class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :id_res
      t.string :login
      t.string :nom_usage
      t.string :prenom_usage
      t.string :courriel
      t.text :profils
      t.date :date_premiere_connexion
      t.date :date_derniere_connexion

      t.timestamps
      t.userstamps # created_by et updated_by
    end

    create_table :preferences do |t|
      t.string :code
      t.text :valeur
      t.references :user

      t.timestamps
      t.userstamps # created_by et updated_by
    end

  end
end
