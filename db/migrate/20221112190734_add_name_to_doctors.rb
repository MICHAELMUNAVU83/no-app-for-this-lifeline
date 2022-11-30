# frozen_string_literal: true

class AddNameToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :name, :string
  end
end
