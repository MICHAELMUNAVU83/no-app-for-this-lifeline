class PreExistingConditionsController < ApplicationController
  before_action :set_patient
  before_action :set_pre_existing_condition, only: %i[show edit update destroy]
  before_action :authenticate_doctor!, only: %i[new edit create update]

  # GET patients/1/pre_existing_conditions
  def index
    @pre_existing_conditions = @patient.pre_existing_conditions
  end

  # GET patients/1/pre_existing_conditions/1
  def show; end

  # GET patients/1/pre_existing_conditions/new
  def new
    @pre_existing_condition = @patient.pre_existing_conditions.build
  end

  # GET patients/1/pre_existing_conditions/1/edit
  def edit; end

  # POST patients/1/pre_existing_conditions
  def create
    @pre_existing_condition = @patient.pre_existing_conditions.build(pre_existing_condition_params)

    if @pre_existing_condition.save
      redirect_to(@pre_existing_condition.patient)
    else
      render action: 'new'
    end
  end

  # PUT patients/1/pre_existing_conditions/1
  def update
    @pre_existing_condition = @patient.pre_existing_conditions.find(params[:id])
    @pre_existing_condition.update(pre_existing_condition_params)
    redirect_to(@pre_existing_condition.patient)
  end

  # DELETE patients/1/pre_existing_conditions/1
  def destroy
    @pre_existing_condition.destroy

    redirect_to patient_pre_existing_conditions_url(@patient)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_pre_existing_condition
    @pre_existing_condition = @patient.pre_existing_conditions.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pre_existing_condition_params
    params.require(:pre_existing_condition).permit(:diabetes, :hypertension, :asthma)
  end
end
