# == Schema Information
#
# Table name: patient_requests
#
#  id             :integer          not null, primary key
#  description    :text
#  image          :string
#  injury_type    :string
#  pain           :integer
#  queue_position :integer
#  rank           :integer
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class PatientRequest < ApplicationRecord
  resourcify
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :comments, class_name: "Comment", foreign_key: "patient_request_id", dependent: :destroy

  validates :description, presence: true, length: {maximum: 1000, too_long: "%{count} characters is the maximum allowed"}

  INJURY_SCORES = {
    'minor' => 2,
    'moderate' => 5,
    'severe' => 8,
    'critical' => 10
  }.freeze

  def set_queue_position
    injury_score = INJURY_SCORES[self.injury_type] || 0
    # Define weights
    w_p = 1.0
    w_i = 2.0
    w_t = 0.1

    # Calculate time factor in hours
    time_now = Time.current
    time_difference = time_now - self.created_at
    time_factor = time_difference / 1.hour

    self.queue_position = (self.pain * w_p) + (injury_score * w_i) - (time_factor * w_t)
    self.save
  end

  # Class method to rank patients
  def self.rank_patients
    # Calculate queue positions for all patient requests
    all.each(&:set_queue_position) # Recalculate if necessary
    
    # Sort patients by queue position in descending order
    sorted_patients = all.order(queue_position: :desc)

    # Assign ranks
    sorted_patients.each_with_index do |patient, index|
      patient.update(rank: index + 1) # Update or add rank attribute
    
    end
  end

  def self.get_top
    top_patient = all.order(rank: :asc).first
    return nil unless top_patient # Return nil if there's no top patient
  
    top_patient.user.first_name
  end
  
end
