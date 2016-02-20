class MainController < ApplicationController
  def index
    redirect_to controller: 'health', action: 'index'
  end
end
