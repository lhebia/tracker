class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def new
    @vendor = Vendor.new(account_id: current_user.account_id)
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.account_id = current_user.account_id

    if @vendor.save
      respond_to do |format|
        format.html { redirect_to vendors_path, notice: "Vendor was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @vendors = Vendor.for_account(current_user.account_id)
  end

  def edit
  end

  def update
    if @vendor.update(vendor_params)
      redirect_to vendor_path(@vendor.id), notice: "Vendor was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_path, notice: "Vendor was successfully destroyed." }
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(
      :name,
      :description,
      :post_code
    )
  end

  def set_vendor
    @vendor = Vendor.for_account(current_user.account_id).find(params[:id])
  end
end
