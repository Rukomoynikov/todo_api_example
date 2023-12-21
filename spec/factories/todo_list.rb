# frozen_string_literal: true

require 'bcrypt'

FactoryBot.define do
  factory :todo_list do
    title { 'TodoList' }
  end
end
