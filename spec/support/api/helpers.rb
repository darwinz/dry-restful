# frozen_string_literal: true

module Test
  module APIHelpers
    module_function

    def app
      DryRestfulApi::API.app
    end
  end
end
