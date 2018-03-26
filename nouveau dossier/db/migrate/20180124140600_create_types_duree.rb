class CreateTypesDuree < ActiveRecord::Migration[5.1]
  def change
    create_table :types_duree do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
