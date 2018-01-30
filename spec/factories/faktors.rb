FactoryGirl.define do
  factory :faktor do
    ljudstvo_id { Sifarnik.za_tip('ljudstvo').all.sample.id }
  end
end
