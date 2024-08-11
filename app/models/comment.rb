# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id                 :integer          not null, primary key
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  patient_request_id :integer
#
class Comment < ApplicationRecord
  belongs_to :form, required: true, class_name: 'PatientRequest', foreign_key: 'patient_request_id'
end
