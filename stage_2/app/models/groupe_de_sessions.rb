class GroupeDeSessions < ApplicationRecord
  self.table_name = "groupes_de_sessions" 
  
  belongs_to :formation, required: false

  has_many :sessions_formation

  accepts_nested_attributes_for :sessions_formation, allow_destroy: true

end
