class VitalParametersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_vital_parameter, only: [:show, :edit, :update, :destroy]

  def index
    @vital_parameters = VitalParameter.all
  end

  def new
    @vital_parameter = VitalParameter.new
  end

  def create
    @vital_parameter = VitalParameter.new(vital_params)

    if @vital_parameter.save
      redirect_to @vital_parameter, notice: 'Vital parameters was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @vital_parameter.update(vital_params)
      redirect_to @vital_parameter, notice: 'Vital parameters was successfully updated.'
    else
      render 'edit'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @vital_parameter.destroy

    redirect_to vital_parameters_path
  end

  private
  def vital_params
    params.require(:vital_parameter).permit(:gender, :age, :height, :weight, :heart_rate,
                                   :systolic_blood_pressure, :diastolic_pressure)
  end

  def find_vital_parameter
    @vital_parameter = VitalParameter.find(params[:id])
  end
end
