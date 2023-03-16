import Rails from "@rails/ujs";
import { Controller } from "stimulus"
export default class extends Controller {
  static targets = ["input", "list"]
  connect() {
  }

  test({params: { url }}) {

    Rails.ajax({
      url: `${url}?v=${this.inputTarget.value}`,
      type: 'GET',
      dataType: 'json',
      contentType: 'application/json', // Ajout de l'option contentType,
      accept: 'application/json',
      success: (data) => {
        let content = JSON.parse(data).content
        this.listTarget.outerHTML = content
      }
    })
  }



}
