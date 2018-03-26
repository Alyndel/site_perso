class DropTablesActualitesCkeditor < ActiveRecord::Migration[5.1]
  def change
    drop_table :actualites
    drop_table :ckeditor_assets
  end
end
