class CreateMatricules < ActiveRecord::Migration[5.1]
  def change
    create_table :matricules do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
