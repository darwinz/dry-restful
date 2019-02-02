# frozen_string_literal: true

require 'bundler/setup'

# rubocop:disable Lint/HandleExceptions
begin
  require 'pry-byebug'
rescue LoadError
end
# rubocop:enable Lint/HandleExceptions

require_relative 'dry_restful_api/container'

DryRestfulApi::Container.finalize!

# Load sub-apps
app_paths = Pathname(__FILE__).dirname.join('../apps').realpath.join('*')
Dir[app_paths].each do |f|
  require "#{f}/system/boot"
end

require 'dry_restful_api/api'
