class SifarnikTip < ApplicationRecord
  has_many :sifarnici, class_name: 'Sifarnik', dependent: :destroy

  validates_presence_of :identifikator
  validates_uniqueness_of :identifikator

  class << self
    def za_identifikator identifikator
      find_by identifikator: identifikator
    end
    alias_method :[], :za_identifikator
  end
end
