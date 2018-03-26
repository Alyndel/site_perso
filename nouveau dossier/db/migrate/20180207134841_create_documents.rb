class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :libelle
      t.string :document
      t.float :ordre

      t.timestamps
    end
  end
end
