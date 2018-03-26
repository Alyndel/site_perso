class AddAttachmentPlanToSalles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :salles do |t|
      t.attachment :plan
    end
  end

  def self.down
    remove_attachment :salles, :plan
  end
end
