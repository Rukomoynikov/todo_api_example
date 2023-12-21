# frozen_string_literal: true

class Account < ApplicationRecord
  include Rodauth::Model(RodauthMain)
  enum :status, unverified: 1, verified: 2, closed: 3
  has_many :todo_lists
end
