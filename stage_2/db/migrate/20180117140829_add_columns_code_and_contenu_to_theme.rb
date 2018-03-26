class AddColumnsCodeAndContenuToTheme < ActiveRecord::Migration[5.1]
  def change
  	add_column :themes, :code, :string
  	add_column :themes, :contenu, :text
  end
end
