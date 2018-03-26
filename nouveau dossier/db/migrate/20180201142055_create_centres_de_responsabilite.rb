class CreateCentresDeResponsabilite < ActiveRecord::Migration[5.1]
  def change
    create_table :centres_de_responsabilite do |t|
      t.string :code
      t.string :libelle

      t.timestamps
    end
  end
end
