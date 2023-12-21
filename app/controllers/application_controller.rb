# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def current_account
    rodauth.rails_account
  end
end
