class SifarnikVeze < ApplicationRecord
  belongs_to :incident
  belongs_to :sifarnik

  validates_presence_of :sifarnik_id, :incident_id
end
