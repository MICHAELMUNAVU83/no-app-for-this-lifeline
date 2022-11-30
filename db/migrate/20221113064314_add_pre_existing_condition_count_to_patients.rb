class AddPreExistingConditionCountToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :pre_existing_condition_count, :integer , default: 0
  end
end
