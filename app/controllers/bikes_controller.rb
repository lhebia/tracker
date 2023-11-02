class BikesController < ApplicationController
    before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.for_user(current_user).ordered
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user

    if @bike.save
      respond_to do |format|
        format.html { redirect_to bikes_path, notice: "Bike was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bikes_path, notice: "Bike was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bike.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Bike was successfully destroyed." }
    end
  end

  private

  def set_bike
    @bike = Bike.for_user(current_user).find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name)
  end
end
