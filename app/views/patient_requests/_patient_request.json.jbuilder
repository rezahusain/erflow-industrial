json.extract! patient_request, :id, :user_id, :description, :image, :status, :pain, :created_at, :updated_at
json.url patient_request_url(patient_request, format: :json)
