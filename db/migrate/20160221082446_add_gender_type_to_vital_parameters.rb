class AddGenderTypeToVitalParameters < ActiveRecord::Migration
  def change
    add_column :vital_parameters, :gender, :string, default: "Female"
  end
end
