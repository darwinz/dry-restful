# frozen_string_literal: true

require 'dry_restful_api/operation'
require 'dry/validation'

module DryRestfulApi
  module Main
    module Operations
      module Cors
        class SetCorsHeaders < DryRestfulApi::Operation
          def call(args)
            if allow_origins.present? && allow_origins.first == 'star'
              args.response.headers['Access-Control-Allow-Origin'] = '*'
            elsif (origin_by_ip = args.headers['HTTP_ORIGIN'].to_s) =~ %r[^http://(?:[0-9]{1,3}\.){3}[0-9]{1,3}$] &&
                  allow_origins.detect { |o| o =~ /^(?:[0-9]{1,3}\.)/ && origin_by_ip =~ %r{^http://#{o}\.} }

              args.response.headers['Access-Control-Allow-Origin'] = origin_by_ip
            elsif (origin = URI(args.headers['HTTP_ORIGIN'].to_s).host).present? &&
                  allow_origins.detect { |o| origin =~ /\.#{o}$|^#{o}$/i }

              args.response.headers['Access-Control-Allow-Origin'] = args.headers['HTTP_ORIGIN']
            end

            args.response.headers['Access-Control-Allow-Methods'] = ENV['CORS_METHODS'].presence || 'POST,GET,OPTIONS,DELETE,PUT'
            args.response.headers['Access-Control-Allow-Headers'] = ENV['CORS_HEADERS'].presence || 'Accept,Content-Type,X-Requested-With'
            args.response.headers['Access-Control-Max-Age'] = '86400'

            args.response.write('')

            Success(args)
          end

          def allow_origins
            @allow_origins ||= ENV['CORS_ALLOWED_ORIGINS'].to_s.split(/\s*\|\s*/)
          end

          # def request_origin(request, params)
          #   (request.headers['HTTP_HTTP_ORIGIN'] || request.headers['HTTP_ORIGIN'] || params[:origin]).to_s
          # end
        end
      end
    end
  end
end
