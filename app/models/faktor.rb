class Faktor < ApplicationRecord
  extend Sifarnik::ActiveRecord
  belongs_to :incident

  belongs_to :ljudstvo, -> { where tip_id: SifarnikTip['ljudstvo']&.id }, class_name: 'Sifarnik', optional: true
  belongs_to :oprema, -> { where tip_id: SifarnikTip['oprema']&.id }, class_name: 'Sifarnik', optional: true
  belongs_to :primena_lekova, -> { where tip_id: SifarnikTip['primena_lekova']&.id }, class_name: 'Sifarnik', optional: true

  # validates_presence_of :timestamps
end
