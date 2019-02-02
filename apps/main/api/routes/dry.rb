# frozen_string_literal: true

module DryRestfulApi
  module Main
    class API
      # rubocop:disable Metrics/BlockLength
      route('dry', 'v1') do |r|
        r.is :id do |id|
          r[:id] = id

          r.get do
            r.resolve('transactions.v1_get_items_id') do |v1_get_id|
              v1_get_id.call(r) do |m|
                m.success do |data|
                  { dry: data }
                end

                m.failure :fetch_data do |data|
                  response.status = 404
                  data
                end
              end
            end
          end
        end

        r.get do
          r.resolve('transactions.get_dry_items') do |dry|
            dry.call(r) do |m|
              m.success do
                response
              end

              m.failure :fetch_dry do |data|
                response.status = 404
                { error: 'failed to fetch dry items', data: data }
              end
            end
          end
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
  end
end
