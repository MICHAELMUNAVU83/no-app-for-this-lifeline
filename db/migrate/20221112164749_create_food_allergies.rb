# frozen_string_literal: true

class CreateFoodAllergies < ActiveRecord::Migration[7.0]
  def change
    create_table :food_allergies do |t|
      t.string :name
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
