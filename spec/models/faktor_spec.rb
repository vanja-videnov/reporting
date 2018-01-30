require 'rails_helper'

RSpec.describe Faktor, type: :model do
  it { should belong_to(:incident) }
  # Validation tests
  # obavezno je samo da je dodat faktor
  # it { should validate_presence_of(:timestamps) }
end
