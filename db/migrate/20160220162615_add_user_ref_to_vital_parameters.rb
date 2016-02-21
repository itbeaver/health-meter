class AddUserRefToVitalParameters < ActiveRecord::Migration
  def change
    add_reference :vital_parameters, :user, index: true, foreign_key: true, null: true
  end
end
