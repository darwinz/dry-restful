# frozen_string_literal: true

require 'dry_restful_api/operation'
require 'dry/validation'

module DryRestfulApi
  module Main
    module Operations
      class FetchItem < DryRestfulApi::Operation
        def call(args)
          if 1 + 1 == 2
            args[:response] = {response: "One plus one is equal to 2"}
            Success(args)
          else
            Failure(error: 'something went wrong or item not found')
          end
        end
      end
    end
  end
end
