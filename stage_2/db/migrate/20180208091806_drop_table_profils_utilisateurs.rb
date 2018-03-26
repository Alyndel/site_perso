class DropTableProfilsUtilisateurs < ActiveRecord::Migration[5.1]
  def change
  	drop_table :profils_utilisateurs
  end
end
