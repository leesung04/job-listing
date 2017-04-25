class WelcomeController < ApplicationController
  def index
    flash[:notice] = "BBang!!!"
  end
end
