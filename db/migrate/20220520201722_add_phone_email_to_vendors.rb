class AddPhoneEmailToVendors < ActiveRecord::Migration[6.1]
  def change
    add_column :vendors, :phone, :integer
    add_column :vendors, :email, :string
  end
end
