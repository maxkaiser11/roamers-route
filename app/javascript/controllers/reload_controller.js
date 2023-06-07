import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reload"
export default class extends Controller {
  connect() {
    setTimeout(function(){
      window.location.reload(1);
    }, 2000);
  }
}
