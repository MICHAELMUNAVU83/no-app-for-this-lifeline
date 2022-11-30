require 'rails_helper'
RSpec.describe DrugAllergy, type: :model do
  it 'should not be valid without a name' do
    food_allergy = DrugAllergy.new(name: nil)
    expect(food_allergy).to_not be_valid
  end

  it 'should be valid with a name' do
    drug_allergy = DrugAllergy.create(name: 'Peanuts')
    expect(drug_allergy).to be_valid
  end
end
