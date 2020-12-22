// js
require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap'

// stylesheets
import '../styles/application'

// images
const images = require.context('../images', true)
