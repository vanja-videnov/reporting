require 'rails_helper'

RSpec.describe Incident, type: :model do
  it { should have_many(:faktori).dependent(:destroy) }
  # Validation tests
  # nije obavezan datum i tip ustanove
  it { should validate_presence_of(:tip_ucesnika_id) }
  it { should validate_presence_of(:starost_bolesnika_id) }
  it { should validate_presence_of(:pol_id) }
  it { should validate_presence_of(:asa_klasifikacija_id) }
  it { should validate_presence_of(:mesto_id) }
  it { should validate_presence_of(:tip_incidenta_id) }
  it { should validate_presence_of(:opis) }
  it { should validate_presence_of(:misljenje) }
  it { should validate_presence_of(:moguce_preventirati) }
  it { should validate_presence_of(:preduzeto_id) }
  it { should validate_presence_of(:ishod_id) }
  it { should validate_presence_of(:uticaj_na_razresenje_id) }
  it { should validate_presence_of(:vaznost_razresenja) }
  it { should validate_presence_of(:ocekivanje_id) }
end
