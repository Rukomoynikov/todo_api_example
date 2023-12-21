# frozen_string_literal: true

class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :body, presence: true, length: { minimum: 5 }
end
