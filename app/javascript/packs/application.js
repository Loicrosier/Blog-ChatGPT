// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// import fontawesome
// import "@fortawesome/fontawesome-free/js/all";
// import "@fortawesome/fontawesome-free/css/all.css";


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
// Internal imports, e.g:
import { textApparition } from '../controllers/text_apparition';

document.addEventListener('turbolinks:load', () => {

  textApparition()
  // Call your functions here, e.g:

});
