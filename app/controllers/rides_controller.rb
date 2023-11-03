class RidesController < ApplicationController
  def index
    @rides = Ride.for_user(current_user)
  end
end
