class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update]

  def index
    @trips = policy_scope(Trip)
    # authorize @trip
  end

  def show
    authorize @trip
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @trip
  end

  def update
    authorize @trip
    EditTripDetailsJob.perform_later(@trip, changes_param[:trip_changes])
    redirect_to trip_path(@trip)
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :budget, :group_size, :interests, :starts_on, :ends_on)
  end

  def changes_param
    params.require(:trip).permit(:trip_changes)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
