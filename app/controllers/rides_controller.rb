class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def new
    @ride = Ride.new(user: current_user)
    @bikes = Bike.for_user(current_user)
  end

  def show
    @bike = Bike.for_user(current_user).find(@ride.bike_id)
  end

  def index
    @rides = Ride.for_user(current_user)
  end

  def edit
    @bikes = Bike.for_user(current_user)
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.user = current_user

    if @ride.save
      respond_to do |format|
        format.html { redirect_to rides_path, notice: "Ride was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @ride.update(ride_params)
      redirect_to rides_path, notice: "Ride was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ride.destroy

    respond_to do |format|
      format.html { redirect_to rides_path, notice: "Ride was successfully destroyed." }
    end
  end

  private

  def ride_params
    params.require(:ride).permit(
      :id,
      :name,
      :date,
      :start_time,
      :end_time,
      :distance,
      :elevation,
      :description,
      :bike_id
    )
  end

  def set_ride
    @ride = Ride.for_user(current_user).find(params[:id])
  end
end
