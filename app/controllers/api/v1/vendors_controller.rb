class VendorsController < ApplicationController

  def create 
    vendor = @current_user.vendors.new(vendor_params)
    return render_error(errors: "Error saving the vendor") unless vendor.save
    result = Vendors.new_vendor(vendor_params, @current_user)
    render_errors(errors: "There was a problem creating a new vendor", status: 400)
    payload = {
      vendor: VendorBlueprint.render_as_hash(result.payload)
    }
    render_success(payload: payload)
  end

  def update
    result = Vendors.update_vendor(params[:id], vendor_params, @current_user))
    render_errors(errors: "There was a problem updating the vendor", status: 400) and return unless result.success?
    payload = {
      vendor: VendorBlueprint.render_as_hash(result.payload)
    }
    render_success(payload: payload)
  end

  def destroy
    result = Vendors.destroy_vendor(params[:id], vendor_params, @current_user)
    render_errors(errors: "There was a problem deleting the vendor", status: 400) and return unless result.success?
    render_success(payload: nil)
  end

  def my_vendors
    render_success(payload: VendorBlueprint.render_as_hash(@current_user.vendors))
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :age, :gender, :race, :phone, :email)
    end
end