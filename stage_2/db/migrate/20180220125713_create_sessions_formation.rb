class CreateSessionsFormation < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions_formation do |t|
      t.string :description
      t.date :date_debut
      t.time :heure_debut
      t.date :date_fin
      t.time :heure_fin
      t.string :statut
      t.boolean :presence

      t.timestamps
    end
  end
end
