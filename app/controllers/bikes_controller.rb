class BikesController < ApplicationController
    before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.ordered
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)

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
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name)
  end
end
