class ChangeNameColumnTypeOfGroupe < ActiveRecord::Migration[5.1]
  def change
  	rename_column :groupes, :type, :type_groupe
  end
end
