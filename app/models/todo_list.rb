# frozen_string_literal: true

class TodoList < ApplicationRecord
  belongs_to :account, optional: true
  has_many :todo_items
  validates :title, presence: true, length: { minimum: 5 }

  scope :anonymous, -> { where(account: null) }
end
