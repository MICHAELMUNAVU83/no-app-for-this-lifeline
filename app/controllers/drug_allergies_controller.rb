class DrugAllergiesController < ApplicationController
  before_action :set_patient
  before_action :set_drug_allergy, only: %i[show edit update destroy]
  before_action :authenticate_doctor!, only: %i[new edit create update]

  # GET patients/1/drug_allergies
  def index
    @drug_allergies = @patient.drug_allergies
  end

  # GET patients/1/drug_allergies/1
  def show; end

  # GET patients/1/drug_allergies/new
  def new
    @drug_allergy = @patient.drug_allergies.build
  end

  # GET patients/1/drug_allergies/1/edit
  def edit; end

  # POST patients/1/drug_allergies
  def create
    @drug_allergy = @patient.drug_allergies.build(drug_allergy_params)

    if @drug_allergy.save
      redirect_to(@drug_allergy.patient)
    else
      render action: 'new'
    end
  end

  # PUT patients/1/drug_allergies/1
  def update
    if @drug_allergy.update_attributes(drug_allergy_params)
      redirect_to([@drug_allergy.patient, @drug_allergy], notice: 'Drug allergy was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE patients/1/drug_allergies/1
  def destroy
    @drug_allergy.destroy

    redirect_to patient_drug_allergies_url(@patient)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_drug_allergy
    @drug_allergy = @patient.drug_allergies.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def drug_allergy_params
    params.require(:drug_allergy).permit(:name, :patient_id)
  end
end
