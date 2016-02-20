class VitalParameter < ActiveRecord::Base
  belongs_to :user

  def calculate_vegetative_index
    (1 - diastolic_pressure / heart_rate) * 100
  end

  def calculate_endurance_factor
    (heart_rate * systolic_blood_pressure * 10) / diastolic_pressure
  end

  def calculate_blood_circulation
    (systolic_blood_pressure - diastolic_pressure) * heart_rate
  end

  def calculate_robinson_index
    heart_rate * systolic_blood_pressure / 100
  end

  def calculate_physical_condition
    middle_pressure = diastolic_pressure + (systolic_blood_pressure - diastolic_pressure) / 3
    physical_condition = (700 - 3 * heart_rate - 2.5 * middle_pressure - 2.7 * age + 0.28 * weight) /
        (350 - 2.6 * age + 0.21 * height)
  end
end
