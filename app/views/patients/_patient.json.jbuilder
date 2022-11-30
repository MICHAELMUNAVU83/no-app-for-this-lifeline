json.extract! patient, :id, :first_name, :last_name, :national_id, :image, :telephone, :gender, :doctor_id,
              :created_at, :updated_at
json.url patient_url(patient, format: :json)
