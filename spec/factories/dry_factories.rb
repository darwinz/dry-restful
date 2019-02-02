# frozen_string_literal: true

require 'faker' unless defined? Faker
require 'bson'

FactoryBot.define do
  factory :dry_item do
    id { BSON::ObjectId.new.to_s }
    category { Faker::Lorem.word }
    details { Faker::Lorem.sentences(2) }
  end
end
