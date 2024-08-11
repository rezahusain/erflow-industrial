# frozen_string_literal: true

json.array! @patient_requests, partial: 'patient_requests/patient_request', as: :patient_request
