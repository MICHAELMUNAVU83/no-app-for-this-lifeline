class FoodAllergiesController < ApplicationController
  before_action :set_patient
  before_action :set_food_allergy, only: %i[show edit update destroy]
  before_action :authenticate_doctor!, only: %i[new edit create update]

  # GET patients/1/food_allergies
  def index
    @food_allergies = @patient.food_allergies
  end

  # GET patients/1/food_allergies/1
  def show; end

  # GET patients/1/food_allergies/new
  def new
    @food_allergy = @patient.food_allergies.build
  end

  # GET patients/1/food_allergies/1/edit
  def edit; end

  # POST patients/1/food_allergies
  def create
    @food_allergy = @patient.food_allergies.build(food_allergy_params)

    if @food_allergy.save
      redirect_to(@food_allergy.patient)
    else
      render action: 'new'
    end
  end

  # PUT patients/1/food_allergies/1
  def update
    if @food_allergy.update_attributes(food_allergy_params)
      redirect_to([@food_allergy.patient, @food_allergy], notice: 'Food allergy was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE patients/1/food_allergies/1
  def destroy
    @food_allergy.destroy

    redirect_to patient_food_allergies_url(@patient)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_food_allergy
    @food_allergy = @patient.food_allergies.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def food_allergy_params
    params.require(:food_allergy).permit(:name, :patient_id)
  end
end
