require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'Valid Patient' do
    let(:patient) do
      Patient.new(first_name: 'Joy', last_name: 'Kwamboka', national_id: 33_503_159, image: 'joy.png',
                  telephone: '0711607261', gender: 'Female')
    end

    it 'is valid with valid attributes' do
      expect(patient).to be_valid
    end

    it 'is not valid without a first name' do
      patient.first_name = nil
      expect(patient).to_not be_valid
    end

    it 'national id is not valid without a number' do
      patient.national_id = 'abc'
      expect(patient).to_not be_valid
    end

    it 'is not valid if last name has less than 3 characters ' do
      patient.last_name = 'Jo'
      expect(patient).to_not be_valid
    end
  end
end
