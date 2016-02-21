class AddUserRefToVitalParameters < ActiveRecord::Migration
  def change
    add_reference :vital_parameters, :user, index: true, foreign_key: true
  end
end
