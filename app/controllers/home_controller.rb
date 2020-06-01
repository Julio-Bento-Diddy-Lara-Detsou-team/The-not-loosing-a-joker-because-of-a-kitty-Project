class HomeController < ApplicationController
  def index
    flash.now[:error] = "Ton message"
  end
end
