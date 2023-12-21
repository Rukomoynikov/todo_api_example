# frozen_string_literal: true

class HtmlApplicationController < ApplicationController
  include ActionView::Layouts
  include ActionController::Rendering

  layout 'application'
end
