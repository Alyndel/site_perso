class CreateSalles < ActiveRecord::Migration[5.1]
  def change
    create_table :salles do |t|
      t.string :nom
      t.string :description
      t.integer :capacite
      t.string :niveau
      t.string :plan
      t.string :image
      t.integer :batiment_id

      t.timestamps
    end
  end
end
