require 'rails_helper'
RSpec.describe FoodAllergy, type: :model do
  it 'should not be valid without a name' do
    food_allergy = FoodAllergy.new(name: nil)
    expect(food_allergy).to_not be_valid
  end

  it 'should be valid with a name' do
    foodallergy = FoodAllergy.create(name: 'Peanuts')
    expect(foodallergy).to be_valid
  end
end
