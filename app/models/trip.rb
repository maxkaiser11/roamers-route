class Trip < ApplicationRecord
  belongs_to :user
  validates :destination, :budget, :group_size, :interests, :starts_on, :ends_on, presence: true
  after_commit :request_trip_details, on: [:create]

  def prompt
    %(I want to travel to #{destination} with a budget of #{budget} € per day. I am traveling with #{group_size}
      people, our interests are: #{interests}. We want to start our trip on #{starts_on} and end our trip on #{ends_on}
      return the activities in a markdown format and use markdown table wherever possible. Structure the response into the following sections: Estimated Expenses, itinerary. Please also format the dates in a nicer way and remove the year)
  end

  def request_trip_details
    FetchTripDetailsJob.perform_later(self)
  end
end
