class SessionFormation < ApplicationRecord
  belongs_to :formation, required: false
  belongs_to :groupe_de_sessions, required: false
  belongs_to :salle, required: false
end
