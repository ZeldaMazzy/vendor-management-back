class AddVendorsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :vendors, foreign_key: true
  end
end
