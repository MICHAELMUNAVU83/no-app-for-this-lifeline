class PatientsController < ApplicationController
  # before_action :authenticate_doctor!, only: %i[index new edit create update destroy]
  before_action :set_patient, only: %i[show edit update destroy]

  # GET /patients or /patients.json
  def index
    @patients = Patient.includes(:doctor).where(doctor_id: current_doctor.id)
  end

  # GET /patients/1 or /patients/1.json
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit; end

  # POST /patients or /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.doctor_id = current_doctor.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: 'Patient was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: 'Patient was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :national_id, :image, :telephone, :gender, :date_of_birth)
  end
end
