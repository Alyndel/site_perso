class CreateBatiments < ActiveRecord::Migration[5.1]
  def change
    create_table :batiments do |t|
      t.string :nom
      t.string :localisation
      t.string :rue
      t.string :code_postal
      t.string :ville
      t.string :plan
      t.string :image
      t.integer :etablissement_id

      t.timestamps
    end
  end
end
