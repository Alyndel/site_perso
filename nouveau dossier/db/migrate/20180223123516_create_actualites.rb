class CreateActualites < ActiveRecord::Migration[5.1]
  def change
    create_table :actualites do |t|
      t.string :titre
      t.text :contenu

      t.timestamps
    end
  end
end
