class CreateIncidenti < ActiveRecord::Migration[5.1]
  def change
    create_table :incidenti do |t|
      t.references :tip_ucesnika
      t.date :datum
      t.references :starost_bolesnika
      t.references :pol
      t.references :asa_klasifikacija
      t.references :tip_ustanove
      t.references :mesto
      t.references :tip_incidenta
      t.string :opis
      t.string :misljenje
      t.boolean :moguce_preventirati
      t.references :preduzeto
      t.references :ishod
      t.references :uticaj_na_razresenje
      t.string :vaznost_razresenja
      t.references :ocekivanje

      t.timestamps
    end
  end
end
