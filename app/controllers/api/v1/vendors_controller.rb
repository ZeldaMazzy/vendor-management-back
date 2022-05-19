class VendorsController < ApplicationController

  def index 
    @vendors = Vendor.all
    render json: @vendors, include: [:projects, :assignments]
  end

  def show
    @vendor = Vendor.find(params[:id])
    render json: @vendor, include: [:projects, :assignments]
  end

  def create 
    @vendor = Vendor.create(name: params[:name])
    render json: @vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(name: params[:name])
    render json: @vendor
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    render json: "Successfully deleted."
  end
end