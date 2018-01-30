class Sifarnik < ApplicationRecord

  # self.param_key          = :sifarnik
  # self.route_key          = :sifarnici
  # self.singular_route_key = :sifarnik

  self.table_name = 'sifarnici'

  belongs_to :tip, class_name: 'SifarnikTip'
  #has_many :veze, dependent: :destroy

  validates_uniqueness_of :identifikator
  validates_presence_of :tip, :aktivno, :identifikator

  class << self
    def za_tip tip_identifikator
      where tip_id: SifarnikTip[tip_identifikator]&.id
    end
  end

  module ActiveRecord
    def [](identifikator)
      za_identifikator identifikator
    end

    def belongs_to_sifarnik attribute, tip_identifikator = nil, options = {}
      tip_identifikator ||= attribute.to_s
      belongs_to attribute, -> do
        where tip_id: SifarnikTip[tip_identifikator]&.id#, class_name: 'Sifarnik'
      end
    end
  end
end
