class CreateSifarnici < ActiveRecord::Migration[5.1]
  def change
    create_table :sifarnici do |t|
      t.references :tip, null: false
      t.boolean :aktivno, null: false, default: true
      t.string :identifikator

      t.timestamps
    end
  end
end
