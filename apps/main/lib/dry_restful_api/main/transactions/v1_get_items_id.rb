# frozen_string_literal: true

require 'dry_restful_api/main/transaction'

module DryRestfulApi
  module Main
    module Transactions
      class V1GetItemsId < Transaction
        step :fetch_item, with: 'operations.fetch_item'
      end
    end
  end
end
