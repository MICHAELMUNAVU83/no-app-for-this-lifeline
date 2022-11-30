class DoctorsController < ApplicationController
  before_action :authenticate_doctor!
  def index
    @doctor = current_doctor
    percentage_of_conditions
    recent_patients
  end

  private

  def percentage_of_conditions
    @patients_id = Patient.where(doctor_id: current_doctor.id).pluck(:id)
    @diabetes = PreExistingCondition.where(diabetes: true).count
    @hypertension = PreExistingCondition.where(hypertension: true).count
    @asthma = PreExistingCondition.where(asthma: true).count
    @total = @diabetes + @hypertension + @asthma

    @diabetes_percentage = @diabetes.to_f / @total * 100
    @hypertension_percentage = @hypertension.to_f / @total * 100
    @asthma_percentage = @asthma.to_f / @total * 100
  end

  def recent_patients
    @patients = Patient.where(doctor_id: current_doctor.id).last(5)
  end
end
