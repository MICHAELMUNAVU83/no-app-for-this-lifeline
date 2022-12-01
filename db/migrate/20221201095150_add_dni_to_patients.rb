class AddDniToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :dni, :boolean
  end
end
