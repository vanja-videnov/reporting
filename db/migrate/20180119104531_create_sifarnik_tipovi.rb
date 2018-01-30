class CreateSifarnikTipovi < ActiveRecord::Migration[5.1]
  def change
    create_table :sifarnik_tipovi do |t|
      t.string :identifikator, null: false

      t.timestamps
    end
  end
end