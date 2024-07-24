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
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class PatientRequest < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :comments, class_name: "Comment", foreign_key: "patient_request_id", dependent: :destroy
end
