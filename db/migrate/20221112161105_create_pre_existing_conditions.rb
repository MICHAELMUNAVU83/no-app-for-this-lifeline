# frozen_string_literal: true

class CreatePreExistingConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_existing_conditions do |t|
      t.boolean :diabetes, default: false
      t.boolean :hypertension, default: false
      t.boolean :asthma, default: false
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
