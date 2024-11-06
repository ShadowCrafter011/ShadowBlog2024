class HomeController < ApplicationController
  def index
    flash.notice = "HELLO"
    flash.alert = "ALERT"
  end
end
