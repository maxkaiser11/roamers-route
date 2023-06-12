class TripChannel < ApplicationCable::Channel
  def subscribed
    trip = Trip.find(params[:id])
    stream_from trip
  end
end
