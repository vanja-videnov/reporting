class CreateSifarnikVeze < ActiveRecord::Migration[5.1]
  def change
    create_table :sifarnik_veze do |t|
      t.references :incident
      t.references :sifarnik

      t.timestamps
    end
  end
end
