# frozen_string_literal: true

require 'dry/web/roda/application'
require_relative 'container'

module DryRestfulApi
  class API < Dry::Web::Roda::Application
    configure do |config|
      config.container = Container
    end

    plugin :error_handler

    route do |r|
      r.run DryRestfulApi::Main::API.freeze.app
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end
  end
end
