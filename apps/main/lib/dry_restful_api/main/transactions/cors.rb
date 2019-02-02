# frozen_string_literal: true

require 'dry_restful_api/main/transaction'

module DryRestfulApi
  module Main
    module Transactions
      class Cors < Transaction
        step :set_cors_headers, with: 'operations.cors.set_cors_headers'
      end
    end
  end
end
