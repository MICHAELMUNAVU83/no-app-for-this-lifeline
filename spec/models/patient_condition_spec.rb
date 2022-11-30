require 'rails_helper'

RSpec.describe PatientCondition, type: :model do
  describe 'Valid Patient Condition' do
    let(:patient_condition) do
      PatientCondition.new(patient_id: 1, pre_existing_condition_id: 1)
    end

    it 'is valid with valid attributes' do
      expect(patient_condition).to be_valid
    end

    it 'is not valid without a patient id' do
      patient_condition.patient_id = nil
      expect(patient_condition).to_not be_valid
    end

    it 'is not valid without a pre existing condition id' do
      patient_condition.pre_existing_condition_id = nil
      expect(patient_condition).to_not be_valid
    end
  end
end
