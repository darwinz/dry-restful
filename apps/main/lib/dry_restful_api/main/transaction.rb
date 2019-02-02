# auto_register: false
# frozen_string_literal: true

require 'dry-transaction'

module DryRestfulApi
  module Main
    class Transaction
      include Dry::Transaction(container: Container)
    end
  end
end
