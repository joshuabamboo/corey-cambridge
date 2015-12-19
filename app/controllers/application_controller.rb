class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_filter :allow_iframe

  private
  def allow_iframe
    response.header.delete "X-Frame-Options"
  end
end
