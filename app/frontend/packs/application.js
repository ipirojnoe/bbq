// js
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap'
import 'air-datepicker/dist/js/datepicker.min'
import '@fortawesome/fontawesome-free/css/all'

import '../scripts/events'

// stylesheets
import '../styles/application'

// images
const images = require.context('../images', true)
