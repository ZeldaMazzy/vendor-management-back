class RemovePhoneFromVendors < ActiveRecord::Migration[6.1]
  def change
    remove_column :vendors, :phone
  end
end
