class PurchaseTransactionsController < ApplicationController
  before_action :set_purchase_transaction, only: [:show, :edit, :update, :destroy]

  def new
    @purchase_transaction = PurchaseTransaction.new(account_id: current_user.account_id)
    @vendors = Vendor.for_account(current_user.account_id)
  end

  def create
    @purchase_transaction = PurchaseTransaction.new(purchase_transaction_params)
    @purchase_transaction.account_id = current_user.account_id

    if @purchase_transaction.save
      respond_to do |format|
        format.html { redirect_to purchase_transactions_path, notice: "Purchase transaction was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @purchase_transactions = PurchaseTransaction.for_account(current_user.account_id)
  end

  def edit
    @vendors = Vendor.for_account(current_user.account_id)
  end

  def update
    if @purchase_transaction.update(purchase_transaction_params)
      redirect_to purchase_transaction_path(@purchase_transaction.id), notice: "Purchase transaction was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase_transaction.destroy

    respond_to do |format|
      format.html { redirect_to purchase_transactions_path, notice: "Purchase transaction was successfully destroyed." }
    end
  end

  private

  def purchase_transaction_params
    params.require(:purchase_transaction).permit(
      :amount,
      :vendor_id,
      :date,
      :description,
      :source_id
    )
  end

  def set_purchase_transaction
    @purchase_transaction = PurchaseTransaction.for_account(current_user.account_id).find(params[:id])
  end
end
