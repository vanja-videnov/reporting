require 'rails_helper'

RSpec.describe SifarnikVeze, type: :model do
  it { should belong_to(:sifarnik) }
  it { should belong_to(:incident) }

end
