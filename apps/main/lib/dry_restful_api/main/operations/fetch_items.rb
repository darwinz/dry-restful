# frozen_string_literal: true

require 'dry_restful_api/operation'
require 'dry/validation'

module DryRestfulApi
  module Main
    module Operations
      class FetchItems < DryRestfulApi::Operation
        def call(args)
          options = args.params.deep_symbolize_keys
          options.reverse_merge!(
            answer: 2
          )

          return Failure(error: 'No items found') if options.nil?

          args[:response] = options || []

          if args[:response].blank?
            Failure(error: 'no new items found')
          else
            Success(args)
          end
        end
      end
    end
  end
end
