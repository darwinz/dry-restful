# frozen_string_literal: true

require_relative 'spec_helper'

require 'rack/test'

Dir[SPEC_ROOT.join('support/api/*.rb').to_s].each(&method(:require))
Dir[SPEC_ROOT.join('shared/api/*.rb').to_s].each(&method(:require))

require SPEC_ROOT.join('../system/boot').realpath

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include Test::APIHelpers

  config.before :suite do
    Test::APIHelpers.app.freeze
  end
end
