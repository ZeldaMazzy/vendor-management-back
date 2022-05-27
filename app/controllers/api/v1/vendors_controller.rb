module Api
  module V1
    class VendorsController < Api::V1::ApplicationController

      def create 
        # vendor = @current_user.vendors.new(vendor_params)
        result = Vendors.new_vendor(vendor_params, @current_user)
        return render_error(errors: "Error saving the vendor", status: 400) unless result.success?

        payload = {
          vendor: VendorBlueprint.render_as_hash(result.payload)
        }
        render_success(payload: payload)
      end

      def update 
        result = Vendors.update_vendor(params[:id], vendor_params, @current_user)
        render_error(errors: "There was a problem updating the vendor", status: 400) and return unless result.success?
        payload = {
          vendor: VendorBlueprint.render_as_hash(result.payload)
        }
        render_success(payload: payload)
      end

      def destroy
        result = Vendors.destroy_vendor(params[:id], @current_user)
        render_error(errors: "There was a problem deleting the vendor", status: 400) and return unless result.success?
        render_success(payload: nil)
      end

      def my_vendors
        render_success(payload: VendorBlueprint.render_as_hash(@current_user.vendors))
      end

      private
        def vendor_params
          params.require(:vendor).permit(:name, :age, :gender, :race, :phone, :email, :image_path, :dayrate, :user_id, :profile_photo)
        end
    end
  end
end