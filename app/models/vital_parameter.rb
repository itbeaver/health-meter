class VitalParameter < ActiveRecord::Base
  after_create :generate_token

  belongs_to :user

  validates :age, :height, :weight, :heart_rate,
            :systolic_blood_pressure, :diastolic_pressure, presence: true

  def calculate_vegetative_index
    (1 - diastolic_pressure.to_f / heart_rate) * 100
  end

  def calculate_endurance_factor
    (heart_rate * systolic_blood_pressure * 10) / (systolic_blood_pressure - diastolic_pressure) / 100
  end

  def calculate_blood_circulation
    (systolic_blood_pressure - diastolic_pressure) * heart_rate
  end

  def calculate_robinson_index
    heart_rate * systolic_blood_pressure / 100
  end

  def calculate_physical_condition
    middle_pressure = diastolic_pressure + (systolic_blood_pressure - diastolic_pressure).to_f / 3
    physical_condition = (700 - 3 * heart_rate - 2.5 * middle_pressure - 2.7 * age + 0.28 * weight) /
        (350 - 2.6 * age + 0.21 * height)
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless VitalParameter.exists?(token: random_token)
    end
  end
end
