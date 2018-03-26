class CreateEtablissements < ActiveRecord::Migration[5.1]
  def change
    create_table :etablissements do |t|
      t.string :code
      t.string :libelle

      t.timestamps
    end
  end
end
