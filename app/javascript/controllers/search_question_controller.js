import Rails from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "container"]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log(this.inputTarget.value);
  }

  test({params: { url }}) {
    console.log(url);
    Rails.ajax({
      url: `${url}?v=${this.inputTarget.value}`,
      type: 'GET',
      dataType: 'JSON',
      // headers: { 'X-Requested-With': 'XMLHttpRequest' }, // Ajoute l'en-tête XHR
      success: (data) => {
        if (data) {
          console.log(data.content);
          // this.containerTarget.outerHTML = data.content
          // do logic for insert question in di
        }

      }
    })
  }



}
