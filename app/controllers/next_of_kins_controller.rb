class NextOfKinsController < ApplicationController
  before_action :set_patient
  before_action :set_next_of_kin, only: %i[show edit update destroy]
  before_action :authenticate_doctor!, only: %i[new edit create update]


  # GET patients/1/next_of_kins
  def index
    @next_of_kins = @patient.next_of_kins
  end

  # GET patients/1/next_of_kins/1
  def show; end

  # GET patients/1/next_of_kins/new
  def new
    @next_of_kin = @patient.next_of_kins.build
  end

  # GET patients/1/next_of_kins/1/edit
  def edit; end

  # POST patients/1/next_of_kins
  def create
    @next_of_kin = @patient.next_of_kins.build(next_of_kin_params)

    if @next_of_kin.save
      redirect_to(@next_of_kin.patient)
    else
      render action: 'new'
    end
  end

  # PUT patients/1/next_of_kins/1
  def update
    if @next_of_kin.update_attributes(next_of_kin_params)
      redirect_to patient_next_of_kin_path(@patient, @next_of_kin), notice: 'Next of kin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE patients/1/next_of_kins/1
  def destroy
    @next_of_kin.destroy

    redirect_to patient_next_of_kins_url(@patient)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_next_of_kin
    @next_of_kin = @patient.next_of_kins.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def next_of_kin_params
    params.require(:next_of_kin).permit(:name, :phone_number, :relation, :patient_id)
  end
end
