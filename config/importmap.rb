# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
# pin 'google-maps', to: "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_JS_API_KEY']}&libraries=places"
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@googlemaps/js-api-loader', to: 'https://ga.jspm.io/npm:@googlemaps/js-api-loader@1.16.2/dist/index.esm.js'
pin "dotenv", to: "https://ga.jspm.io/npm:dotenv@16.3.1/lib/main.js"
pin "buffer", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/buffer.js"
pin "crypto", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/crypto.js"
pin "fs", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/fs.js"
pin "os", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/os.js"
pin "path", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/path.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.0.1/nodelibs/browser/process-production.js"
