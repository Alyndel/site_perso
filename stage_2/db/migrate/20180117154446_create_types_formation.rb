class CreateTypesFormation < ActiveRecord::Migration[5.1]
  def change
    create_table :types_formation do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
