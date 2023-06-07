import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat"
export default class extends Controller {
  connect() {
    const dates = document.querySelectorAll(".trip_starts_on, .trip_ends_on");
    dates.forEach(element => {
      element.classList.add("d-flex", "justify-content-end", "dates-trip");

    });

  function showNextField() {
    let count = 1;
    const inputs = document.querySelectorAll(".form-control, .trip_starts_on>div, .trip_ends_on>div")


      inputs.forEach(element => {
        element.closest(".message-container").classList.add("d-none")

      });

      inputs[0].closest(".message-container").classList.remove("d-none");

      document.addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
          if (count < inputs.length) {
            event.preventDefault();
            let previousInput = inputs[count-1];
            let input = inputs[count];
            if (previousInput.value == "") {

            } else {
              input.closest(".message-container").classList.remove("d-none");
              count++;
              input.focus();
            };
          };
        }
      });


  }

    showNextField();
  }
}
