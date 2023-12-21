# frozen_string_literal: true

FactoryBot.define do
  factory :todo_item do
    body { 'MyString' }
    todo_list
    completed { false }
  end
end
