class ChangeColumnDureeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :formations, :duree, :float
  end
end
