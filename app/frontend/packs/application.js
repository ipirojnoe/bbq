// js
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap'
import 'air-datepicker/dist/js/datepicker.min'
import '@fortawesome/fontawesome-free/css/all'

var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import '../scripts/events'
import '../scripts/users'
import '../scripts/event_lightbox'

// stylesheets
import '../styles/application'

// images
const images = require.context('../images', true)
