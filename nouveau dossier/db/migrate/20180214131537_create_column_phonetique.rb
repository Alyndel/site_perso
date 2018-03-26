class CreateColumnPhonetique < ActiveRecord::Migration[5.1]
  def change
    add_column :utilisateurs, :nom_phonetique, :string
    add_column :utilisateurs, :prenom_phonetique, :string
  end
end
