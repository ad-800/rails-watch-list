import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["movie"]

  connect() {
    console.log(this.contentTarget)
  }

  revealPopup() {
    // Modal Pop Up
    // data-controller="popup"
    // data-popup-target="movie"
    console.log('Stimulus is working');
  }
}
