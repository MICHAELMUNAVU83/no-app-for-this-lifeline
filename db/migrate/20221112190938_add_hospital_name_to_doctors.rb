# frozen_string_literal: true

class AddHospitalNameToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :hospital_name, :string
  end
end
