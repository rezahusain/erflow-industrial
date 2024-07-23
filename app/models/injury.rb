# == Schema Information
#
# Table name: injuries
#
#  id                 :integer          not null, primary key
#  name               :string
#  priority           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  patient_request_id :integer
#
class Injury < ApplicationRecord
  belongs_to :form, required: true, class_name: "PatientRequest", foreign_key: "patient_request_id"
end
