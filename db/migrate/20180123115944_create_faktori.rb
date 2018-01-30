class CreateFaktori < ActiveRecord::Migration[5.1]
  def change
    create_table :faktori do |t|
      t.references :ljudstvo
      t.references :oprema
      t.references :primena_lekova
      t.references :incident

      t.timestamps
    end
  end
end
