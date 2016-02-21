class MainController < ApplicationController
  def index
    redirect_to new_vital_parameter_path
  end
end
