# frozen_string_literal: true

require 'bcrypt'

FactoryBot.define do
  factory :account do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    status { 2 }
    password_hash { BCrypt::Password.create('secret', cost: BCrypt::Engine::MIN_COST) }
  end
end
