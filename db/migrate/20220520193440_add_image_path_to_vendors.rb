class AddImagePathToVendors < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :image_path, :string
  end
end
