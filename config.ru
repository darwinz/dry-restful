# frozen_string_literal: true

require_relative 'system/boot'
require 'rack/cors'

use Rack::Cors do
  # allow all origins in development
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: %i[get post delete put options]
  end
end

run DryRestfulApi::API.freeze.app
