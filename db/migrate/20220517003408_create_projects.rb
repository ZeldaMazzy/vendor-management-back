class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :user
      t.string :client
      t.integer :budget
      t.date :due_date

      t.timestamps
    end
  end
end
