module Vendors

  def self.new_vendor(params, current_user)
    vendor = current_user.vendors.new(params)
    return ServiceContract.error("Error saving vendor") unless vendor.save
    ServiceContract.success(vendor)
  end

  def self.update_vendor(vendor_id, params, current_user)
    vendor = current_user.vendors.find(vendor_id)
    return ServiceContract.error("Error updating vendor") unless vendor.update(params)
    ServiceContract.success(vendor)
  end

  def self.destroy_vendor(vendor_id, current_user)
    vendor = current_user.vendors.find(vendor_id)
    ServiceContract.error("Error deleting vendor") and return unless vendor.destroy
    ServiceContract.success(payload: nil)
  end
  
end