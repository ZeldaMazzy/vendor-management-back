class AddTalentNeededToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :talent_needed, :integer
  end
end
