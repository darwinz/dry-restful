# frozen_string_literal: true

require 'dry/web/container'
require 'dry/system/components'
require './lib/dry_restful_api/components'

module DryRestfulApi
  class Container < Dry::Web::Container
    use :logging
    use :env, inferrer: -> { ENV.fetch('RACK_ENV', :development).to_sym }
    setting :env, ENV['RACK_ENV'] || 'development'

    configure do |config|
      config.name = :dry_restful_api
      config.logger = Logger.new(STDOUT, level: (ENV['LOG_LEVEL'] || 'info'))
      config.listeners = true
      config.default_namespace = 'dry_restful_api'
      config.auto_register = %w[lib/dry_restful_api]
    end

    load_paths! 'lib'

    def self.settings
      config.settings
    end
  end
end
