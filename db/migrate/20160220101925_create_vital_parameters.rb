class CreateVitalParameters < ActiveRecord::Migration
  def change
    create_table :vital_parameters do |t|
      t.integer :age
      t.float :height
      t.float :weight
      t.integer :heart_rate
      t.integer :systolic_blood_pressure
      t.integer :diastolic_pressure

      t.timestamps null: false
    end
  end
end
