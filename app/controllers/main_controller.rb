class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to vital_parameters_path
  end
end
