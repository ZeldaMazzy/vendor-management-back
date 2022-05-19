class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.references :project, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :role, null: false
      t.boolean :is_cast, null: false

      t.timestamps
    end
  end
end
