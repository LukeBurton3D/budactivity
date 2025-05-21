import { Controller } from "@hotwired/stimulus"

// ADDED
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }
  #setInputValue(event) {
  this.addressTarget.value = event.result["place_name"]
}

#clearInputValue() {
  this.addressTarget.value = ""
}

  disconnect() {
    this.geocoder.onRemove()
  }
}

// TO ADD APPLICATION NEW
// Hide the simple_form input field:

// <%= f.input :address, input_html: {data: {"..."}, class: "d-none"} %>
