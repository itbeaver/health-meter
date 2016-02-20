class VitalParameter < ActiveRecord::Base

  def calculate_vegetative_index
    (1 - self.diastolic_pressure / self.heart_rate) * 100
  end

  def calculate_endurance_factor
    (self.heart_rate * self.systolic_blood_pressure * 10) / self.diastolic_pressure
  end

  def calculate_blood_circulation
    (self.systolic_blood_pressure - self.diastolic_pressure) * self.heart_rate
  end

  def calculate_robinson_index
    self.heart_rate * self.systolic_blood_pressure / 100
  end

  def calculate_physical_condition
    middle_pressure = self.diastolic_pressure + (self.systolic_blood_pressure - self.diastolic_pressure) / 3
    physical_condition = (700 - 3 * self.heart_rate - 2.5 * middle_pressure - 2.7 * self.age + 0.28 * self.weight) /
        (350 - 2.6 * self.age + 0.21 * self.height)
  end
end
