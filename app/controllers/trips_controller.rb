class TripsController < ApplicationController

  def index
    @trips = policy_scope(Trip)
    # authorize @trip
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.response = @trip.request_trip_details
    authorize @trip

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :budget, :group_size, :interests, :starts_on, :ends_on)
  end
end
