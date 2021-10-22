import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import "./css/index.scss"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
console.log('Metus engine initialized.')
