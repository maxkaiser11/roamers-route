import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="reload"
export default class extends Controller {
  static values = {tripId: Number}

  connect() {
    console.log(this.tripIdValue)
    this.channel = createConsumer().subscriptions.create(
        {channel: "TripChannel", id: this.tripIdValue},
        {received: data => location.reload()}
    )
  }
}