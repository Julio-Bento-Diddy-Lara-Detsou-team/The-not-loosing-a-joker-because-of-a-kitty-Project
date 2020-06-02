class HomeController < ApplicationController
  def index
    flash.now[:error] = "Ton message"
  end

  def private
  end
end
