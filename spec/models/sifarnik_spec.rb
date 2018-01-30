require 'rails_helper'

RSpec.describe Sifarnik, type: :model do
  it { should belong_to(:tip) }

  it { should validate_presence_of(:identifikator) }
  it { should validate_presence_of(:aktivno) }
end
