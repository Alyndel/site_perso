class CreateUnitesFonctionnelles < ActiveRecord::Migration[5.1]
  def change
    create_table :unites_fonctionnelles do |t|
      t.string :code
      t.string :libelle

      t.timestamps
    end
  end
end
