import Rails from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    console.log('hello');
    console.log(this.inputTarget);
    console.log(this.listTarget);
  }

  test({params: { url }}) {

    Rails.ajax({
      url: `${url}?v=${this.inputTarget.value}`,
      type: 'GET',
      dataType: 'JSON',
      success: (data) => {
        console.log(data);
      }
    })
  }



}
