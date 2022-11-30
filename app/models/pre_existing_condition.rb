class PreExistingCondition < ApplicationRecord
  belongs_to :patient
  after_create :add_pre_existing_condition_count

  def add_pre_existing_condition_count
    patient.pre_existing_condition_count += 1
    patient.save
  end
end
