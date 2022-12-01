class CreateNextOfKins < ActiveRecord::Migration[7.0]
  def change
    create_table :next_of_kins do |t|
      t.string :name
      t.string :phone_number
      t.string :relation
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
