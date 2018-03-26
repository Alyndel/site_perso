class AddAttachmentPlanToBatiments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :batiments do |t|
      t.attachment :plan
    end
  end

  def self.down
    remove_attachment :batiments, :plan
  end
end
