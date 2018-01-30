FactoryGirl.define do
  factory :incident do
    tip_ucesnika_id { Sifarnik.za_tip('tip_ucesnika').all.sample.id }
    starost_bolesnika_id { Sifarnik.za_tip('starost_bolesnika').all.sample.id }
    pol_id { Sifarnik.za_tip('pol').all.sample.id }
    asa_klasifikacija_id { Sifarnik.za_tip('asa_klasifikacija').all.sample.id }
    tip_ustanove_id { Sifarnik.za_tip('tip_ustanove').all.sample.id }
    mesto_id { Sifarnik.za_tip('mesto').all.sample.id }
    tip_incidenta_id { Sifarnik.za_tip('tip_incidenta').all.sample.id }
    preduzeto_id { Sifarnik.za_tip('preduzeto').all.sample.id }
    ishod_id { Sifarnik.za_tip('ishod').all.sample.id }
    uticaj_na_razresenje_id { Sifarnik.za_tip('uticaj_na_razresenje').all.sample.id }
    ocekivanje_id { Sifarnik.za_tip('ocekivanje').all.sample.id }

    #association :tip_ucesnika, factory: :sifarnik
    #tip_ucesnika_id { Faker::Types.integer }
    datum { Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today) }
    # starost_bolesnika_id { Faker::Types.integer }
    # pol_id { Faker::Types.integer }
    # asa_klasifikacija_id { Faker::Types.integer }
    # tip_ustanove_id { Faker::Types.integer }
    # mesto_id { Faker::Types.integer }
    # tip_incidenta_id { Faker::Types.integer }
    opis { Faker::Lorem.word }
    misljenje { 'moje misljenje' }
    moguce_preventirati { 1 }
    # preduzeto_id { Faker::Types.integer }
    # ishod_id { Faker::Types.integer }
    # uticaj_na_razresenje_id { Faker::Types.integer }
    vaznost_razresenja { Faker::Lorem.word }
    # ocekivanje_id { Faker::Types.integer }
    #before(:create) { build :sifarnik}
  end
end
