class Incident < ApplicationRecord
  extend Sifarnik::ActiveRecord

  has_many :faktori, dependent: :destroy
  #has_many :sifarnik_veze, dependent: :destroy

  belongs_to :tip_ucesnika, -> { where tip_id: SifarnikTip['tip_ucesnika']&.id }, class_name: 'Sifarnik'
  belongs_to :starost_bolesnika, -> { where tip_id: SifarnikTip['starost_bolesnika']&.id }, class_name: 'Sifarnik'
  belongs_to :pol, -> { where tip_id: SifarnikTip['pol']&.id }, class_name: 'Sifarnik'
  belongs_to :asa_klasifikacija, -> { where tip_id: SifarnikTip['asa_klasifikacija']&.id }, class_name: 'Sifarnik'
  belongs_to :tip_ustanove, -> { where tip_id: SifarnikTip['tip_ustanove']&.id }, class_name: 'Sifarnik', optional: true
  belongs_to :mesto, -> { where tip_id: SifarnikTip['mesto']&.id }, class_name: 'Sifarnik'
  belongs_to :tip_incidenta, -> { where tip_id: SifarnikTip['tip_incidenta']&.id }, class_name: 'Sifarnik'
  belongs_to :preduzeto, -> { where tip_id: SifarnikTip['preduzeto']&.id }, class_name: 'Sifarnik'
  belongs_to :ishod, -> { where tip_id: SifarnikTip['ishod']&.id }, class_name: 'Sifarnik'
  belongs_to :uticaj_na_razresenje, -> { where tip_id: SifarnikTip['uticaj_na_razresenje']&.id }, class_name: 'Sifarnik'
  belongs_to :ocekivanje, -> { where tip_id: SifarnikTip['ocekivanje']&.id }, class_name: 'Sifarnik'

  # belongs_to_sifarnik :tip_ucesnika
  # belongs_to_sifarnik :starost_bolesnika
  # belongs_to_sifarnik :pol
  # belongs_to_sifarnik :asa_klasifikacija
  # belongs_to_sifarnik :tip_ustanove
  # belongs_to_sifarnik :mesto
  # belongs_to_sifarnik :tip_incidenta
  # belongs_to_sifarnik :preduzeto
  # belongs_to_sifarnik :ishod
  # belongs_to_sifarnik :uticaj_na_razresenje
  # belongs_to_sifarnik :ocekivanje

  validates_presence_of :tip_ucesnika_id, :starost_bolesnika_id, :pol_id, :asa_klasifikacija_id,
   :mesto_id, :tip_incidenta_id, :opis, :misljenje, :moguce_preventirati, :preduzeto_id,
   :ishod_id, :uticaj_na_razresenje_id, :vaznost_razresenja, :ocekivanje_id
end
