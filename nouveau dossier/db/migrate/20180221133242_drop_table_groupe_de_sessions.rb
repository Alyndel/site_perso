class DropTableGroupeDeSessions < ActiveRecord::Migration[5.1]
  def change
    drop_table :groupes_de_sessions;
  end
end
