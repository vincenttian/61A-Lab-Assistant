class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DeviseSettings
  include AuthorizationHelpers

  before_filter :set_header

  def set_header
    @header = "no_header"
  end
end
