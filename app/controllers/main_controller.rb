class MainController < ApplicationController
  def index
    redirect_to vital_parameters_path
  end
end
