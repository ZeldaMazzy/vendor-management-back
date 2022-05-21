class AddPhoneToVendors < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :phone, :bigint
  end
end
