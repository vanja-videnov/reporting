FactoryGirl.define do
  factory :sifarnik do |s|
    # association :tip, factory: :sifarnik_tip
    # aktivno true
    # sequence(:identifikator) { |n| "sifarnik-#{n}" }
    #before(:create) { build :sifarnik_tip}
  end
end
