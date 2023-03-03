import Rails from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "container"]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log(this.inputTarget.value);
  }

  test({params: { url }}) {
    Rails.ajax({
      url: `${url}?v=${this.inputTarget.value}`,
      type: 'GET',
      datatype: 'JSON',
      success: (data) => {
        console.log(data.content);
      }
    })
  }



}
