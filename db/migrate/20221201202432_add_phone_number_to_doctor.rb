class AddPhoneNumberToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :phone_number, :string
  end
end
