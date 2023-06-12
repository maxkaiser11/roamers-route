class FetchTripDetailsJob < ApplicationJob
  queue_as :default

  def perform(trip)
    if true
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", # Required.
            messages: [{ role: "user", content: trip.prompt}], # Required.
            temperature: 0.5,
        })
      trip.update(response: response.dig("choices", 0, "message", "content"), updated: true)
    else
      trip.update(response: ".\n\nUnfortunately, a budget of 500 euros per day for four people in London may be difficult to manage. London is known for being an expensive city, and costs can quickly add up, especially when it comes to accommodation, food, and transportation.\n\nHowever, with some careful planning, it may be possible to make the most of your budget and enjoy a memorable trip to London. Here are some tips to help you plan your trip:\n\n1. Book your accommodation in advance: London has a wide range of accommodation options, from budget hostels to luxury hotels. However, prices can vary widely, and it's important to book early to secure the best deals. Consider staying in a hotel or hostel outside the city center, where prices may be lower.\n\n2. Use public transportation: While London has an extensive public transportation network, it can be expensive. Consider purchasing an Oyster card, which provides discounted fares on buses, trains, and the underground. Alternatively, consider renting bikes to explore the city.\n\n3. Prioritize your sightseeing: London has a wealth of attractions, from world-famous museums to historic landmarks. However, entrance fees can add up quickly. Consider prioritizing your must-see sights and look for free or discounted admission options.\n\n4. Take advantage of free activities: London has many free activities, including parks, markets, and street performers. Consider exploring some of these options to save money.\n\n5. Plan your meals: Eating out in London can be expensive, especially in tourist areas. Look for budget-friendly options, such as street food or local markets. Consider preparing some meals yourself to save money.\n\nOverall, while a budget of 500 euros per day for four people in London may be challenging, with some careful planning and prioritization, it may be possible to enjoy a memorable trip while staying within your budget.")
    end
  end
end
