class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :race
      t.integer :height
      t.integer :weight
      t.integer :dayrate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
