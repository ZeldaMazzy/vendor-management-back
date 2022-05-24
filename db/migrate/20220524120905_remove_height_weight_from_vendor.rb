class RemoveHeightWeightFromVendor < ActiveRecord::Migration[6.1]
  def change
    remove_column :vendors, :height
    remove_column :vendors, :weight 
  end
end
