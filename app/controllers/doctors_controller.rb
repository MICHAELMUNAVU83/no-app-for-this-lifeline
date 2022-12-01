class DoctorsController < ApplicationController
  def index
    @doctor = current_doctor
    percentage_of_conditions
    recent_patients
  end

  def splash; end

  private

  def percentage_of_conditions
    @patients_id = Patient.where(doctor_id: current_doctor.id).pluck(:id)
    @diabetes = PreExistingCondition.where(diabetes: true).count
    @hypertension = PreExistingCondition.where(hypertension: true).count
    @asthma = PreExistingCondition.where(asthma: true).count
    @total = @diabetes + @hypertension + @asthma 

    if @diabetes.zero? && @hypertension.zero? && @asthma.zero?

      @diabetes_percentage = 0
      @hypertension_percentage = 0
      @asthma_percentage = 0
    else

    @diabetes_percentage = (@diabetes.to_f / @total * 100).round(2)
    @hypertension_percentage = (@hypertension.to_f / @total * 100).round(2)
    @asthma_percentage = (@asthma.to_f / @total * 100).round(2)
    end

  end

  def recent_patients
    @patients = Patient.where(doctor_id: current_doctor.id).last(5)
  end

  def logout
    redirect_to unauthenticated_root_path
  end
end
