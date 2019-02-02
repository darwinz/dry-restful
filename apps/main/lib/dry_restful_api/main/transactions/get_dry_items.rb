# frozen_string_literal: true

require 'dry_restful_api/main/transaction'

module DryRestfulApi
  module Main
    module Transactions
      class GetItems < Transaction
        step :fetch_items, with: 'operations.fetch_items'
      end
    end
  end
end
