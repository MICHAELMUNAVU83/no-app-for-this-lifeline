# frozen_string_literal: true

class AddNationalDoctorIdToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :national_doctor_id, :integer
  end
end
