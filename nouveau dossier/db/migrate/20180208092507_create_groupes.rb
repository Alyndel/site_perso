class CreateGroupes < ActiveRecord::Migration[5.1]
  def change
    create_table :groupes do |t|
      t.string :code
      t.string :libelle
      t.string :type

      t.timestamps
    end
  end
end
