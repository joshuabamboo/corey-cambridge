class PagesController < ApplicationController
  after_filter :allow_iframe

  def home
  end

  def videos
  end

  def music
  end

  private
  def allow_iframe
    response.header.delete "X-Frame-Options"
  end
end
