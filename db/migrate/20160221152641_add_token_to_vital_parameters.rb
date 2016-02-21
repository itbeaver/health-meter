class AddTokenToVitalParameters < ActiveRecord::Migration
  def change
    add_column :vital_parameters, :token, :string
  end
end
