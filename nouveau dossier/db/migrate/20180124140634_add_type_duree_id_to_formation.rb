class AddTypeDureeIdToFormation < ActiveRecord::Migration[5.1]
  def change
    add_column :formations, :type_duree_id, :integer
  end
end
