class RidesController < ApplicationController
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @rides = Ride.for_user(current_user)
  end

  private

  def set_ride
    @ride = Ride.for_user(current_user).find(params[:id])
  end
end
