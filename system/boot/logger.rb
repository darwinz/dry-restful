# frozen_string_literal: true

DryRestfulApi::Container.boot(:logger) do
  init do
    require 'logger'
  end

  start do
    DryRestfulApi::Container.logger
  end
end
