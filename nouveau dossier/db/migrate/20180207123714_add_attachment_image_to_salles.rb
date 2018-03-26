class AddAttachmentImageToSalles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :salles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :salles, :image
  end
end
