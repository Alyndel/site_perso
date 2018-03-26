class AddColumnFormationIdToDocument < ActiveRecord::Migration[5.1]
  def self.up
  	add_column :documents, :formation_id, :integer
  end

  def self.down
  	remove_column :documents, :formation_id
  end
end
