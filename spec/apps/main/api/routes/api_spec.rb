# frozen_string_literal: true

require 'api_spec_helper'

RSpec.describe DryRestfulApi::Main::API, type: :request do
  TRANSACTIONS = DryRestfulApi::Main::Transactions

  describe 'v1 routes' do
    context 'GET /v1/dry/{:id}' do
      let(:id) { '1' }

      subject { get "/v1/dry/#{id}" }

      it 'should call transaction' do
        expect_any_instance_of(TRANSACTIONS::V1GetItemsId).to receive(:call).exactly(1).times
      end
    end

    context 'GET /v1/dry' do
      subject { get '/v1/dry'}

      it 'should call transaction' do
        expect_any_instance_of(TRANSACTIONS::GetItems).to receive(:call).exactly(1).times
      end
    end
  end
end
