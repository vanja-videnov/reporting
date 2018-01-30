require 'rails_helper'

RSpec.describe SifarnikTip, type: :model do
  it { should validate_presence_of(:identifikator) }
end
